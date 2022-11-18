FROM ubuntu:22.10

RUN apt-get update && apt-get install -y openjdk-11-jre && apt-get install -y wget
WORKDIR /opt
RUN wget https://dlcdn.apache.org/kafka/3.3.1/kafka_2.13-3.3.1.tgz && tar -xzf kafka_2.13-3.3.1.tgz && mv kafka_2.13-3.3.1 kafka && cd kafka
WORKDIR /opt/kafka
RUN wget https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/2.0.0.Final/debezium-connector-mysql-2.0.0.Final-plugin.tar.gz && \
tar -xzf debezium-connector-mysql-2.0.0.Final-plugin.tar.gz && rm debezium-connector-mysql-2.0.0.Final-plugin.tar.gz && \
mkdir plugins && mv debezium-connector-mysql plugins/debezium-connector-mysql
RUN mkdir /opt/kafka/plugins/confluent-elasticsearch-sink-connector
COPY ./config/confluent-elasticsearch-sink-connector /opt/kafka/plugins/confluent-elasticsearch-sink-connector
COPY ./config/connect-standalone.properties config/connect-standalone.properties
COPY ./config/mysql-source-connector.properties config/mysql-source-connector.properties
COPY ./config/elastic-sink-connector.properties config/elastic-sink-connector.properties
#COPY ./config/connect-distributed.properties config/connect-distributed.properties
ENTRYPOINT ["bash", "-c", "bin/connect-standalone.sh config/connect-standalone.properties config/mysql-source-connector.properties config/elastic-sink-connector.properties"]
#ENTRYPOINT ["bin/connect-distributed.sh config/connect-distributed.properties"]