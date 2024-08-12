from datetime import datetime
import logging
import os
import json

import confluent_kafka

from alpaca_subscriber import L2CryptoDataStream

logging.basicConfig(level=logging.INFO)

KAFKA_BROKER = os.getenv("KAFKA_BROKER")
KAFKA_TOPIC = os.getenv("KAFKA_TOPIC")
ALPACA_API_KEY = os.getenv("ALPACA_API_KEY")
ALPACA_SECRET_KEY = os.getenv("ALPACA_SECRET_KEY")
ALPACA_BASE_URL = os.getenv("ALPACA_BASE_URL")


def json_encoder(x):
    x['timestamp'] = x['timestamp'].strftime('%Y-%m-%d %H:%M:%S.%f')
    return json.dumps(x).encode('utf-8')


message_encoders = {
    "default": json_encoder,
    "json": json_encoder,
}


class KafkaPublisher:
    def __init__(self, kafka_broker, kafka_topic, encoder='default'):
        self.kafka_broker = kafka_broker
        self.kafka_topic = kafka_topic
        self.publisher = confluent_kafka.Producer({"bootstrap.servers": kafka_broker})
        self.encoder = message_encoders.get(encoder, message_encoders['default'])
    
    def _callback(self, err, msg):
        if err is not None:
            logging.warning(f"Message to {msg.topic()} delivery failed: {err}")

    async def publish(self, msg):
        msg = self.encoder(msg)
        self.publisher.produce(self.kafka_topic, msg, callback=self._callback)
        self.publisher.poll(0)


if __name__ == "__main__":

    alpaca_crypto_client = L2CryptoDataStream(
        api_key=ALPACA_API_KEY,
        secret_key=ALPACA_SECRET_KEY,
        raw_data=False,
    )

    kafka_publisher = KafkaPublisher(
        kafka_broker=KAFKA_BROKER,
        kafka_topic=KAFKA_TOPIC,
        encoder='json',
    )

    symbols = ("BTC/USD")
    alpaca_crypto_client.subscribe_orderbook(kafka_publisher.publish, symbols)
    alpaca_crypto_client.run()
