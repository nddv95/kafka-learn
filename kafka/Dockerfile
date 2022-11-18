FROM ubuntu:22.10

RUN apt-get update && apt-get install -y openjdk-11-jre && apt-get install -y wget
WORKDIR /opt
RUN wget https://dlcdn.apache.org/kafka/3.3.1/kafka_2.13-3.3.1.tgz && tar -xzf kafka_2.13-3.3.1.tgz && mv kafka_2.13-3.3.1 kafka && cd kafka
WORKDIR /opt/kafka
COPY ./config/kafka-start.sh kafka-start.sh
RUN chmod +x kafka-start.sh
ENTRYPOINT ["./kafka-start.sh"]