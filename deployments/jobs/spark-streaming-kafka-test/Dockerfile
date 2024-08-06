FROM registry.polyvaria.com/spark-streaming-job-base:0.1
COPY read_kafka_write_disk.py /app
CMD ["spark-submit", "--jars", "/opt/bitnami/spark/jars/commons-pool2-2.12.0.jar,/opt/bitnami/spark/jars/spark-token-provider-kafka-0-10_2.12-3.5.1.jar,/opt/bitnami/spark/jars/spark-streaming-kafka-0-10_2.12-3.5.1.jar,/opt/bitnami/spark/jars/spark-sql-kafka-0-10_2.12-3.5.1.jar,/opt/bitnami/spark/jars/kafka-clients-3.7.0.jar", "/app/read_kafka_write_disk.py"]
