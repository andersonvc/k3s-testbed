FROM registry.polyvaria.com/spark:3.5.1-debian-12-r12
RUN pip install confluent-kafka
USER 0
COPY spark-sql-kafka-0-10_2.12-3.5.1.jar /opt/bitnami/spark/jars
COPY kafka-clients-3.7.0.jar /opt/bitnami/spark/jars
COPY spark-streaming-kafka-0-10_2.12-3.5.1.jar /opt/bitnami/spark/jars
COPY spark-token-provider-kafka-0-10_2.12-3.5.1.jar /opt/bitnami/spark/jars
COPY commons-pool2-2.12.0.jar /opt/bitnami/spark/jars

RUN mkdir -p /app
WORKDIR /app