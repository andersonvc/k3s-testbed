from pyspark.sql import SparkSession


def extract_data(session: SparkSession, topic: str):
  KAFKA_BOOTSTRAP_SERVERS = "polyvaria-cluster-kafka-brokers:9092"
  df = session.readStream.format("kafka") \
    .option("kafka.bootstrap.servers", KAFKA_BOOTSTRAP_SERVERS) \
    .option("subscribe", topic) \
    .load()
  return df


def transform_data(df):
  df = df.selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)")
  return df


def load_data(df):
  query = df \
    .writeStream \
    .format("csv") \
    .outputMode('append') \
    .option("format", "append") \
    .option("path", "/mnt/data/test-stream") \
    .option("checkpointLocation", "/mnt/data/checkpoint") \
    .trigger(processingTime='5 seconds') \
    .start()
  return query


def main():

  topic = 'stream'

  session = SparkSession.builder.appName("KafkaStreamingJob").getOrCreate()
  query = load_data(transform_data(extract_data(session, topic)))
  query.awaitTermination()


if __name__ == '__main__':
  main()