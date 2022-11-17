FROM ubuntu:22.10

RUN apt-get update && apt-get install -y openjdk-8-jre && apt-get install -y wget
WORKDIR /opt
RUN wget https://dlcdn.apache.org/kafka/3.3.1/kafka_2.13-3.3.1.tgz && tar -xzf kafka_2.13-3.3.1.tgz && mv kafka_2.13-3.3.1 kafka && cd kafka
WORKDIR /opt/kafka
RUN wget https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/2.0.0.Final/debezium-connector-mysql-2.0.0.Final-plugin.tar.gz && \
tar -xzf debezium-connector-mysql-2.0.0.Final-plugin.tar.gz && rm debezium-connector-mysql-2.0.0.Final-plugin.tar.gz && \
mkdir plugins && mv debezium-connector-mysql plugins/debezium-connector-mysql
COPY ./config/connect-standalone.properties config/connect-standalone.properties
#COPY ./config/connect-distributed.properties config/connect-distributed.properties
ENTRYPOINT ["bin/connect-standalone.sh config/connect-standalone.properties"]
#ENTRYPOINT ["bin/connect-distributed.sh config/connect-distributed.properties"]