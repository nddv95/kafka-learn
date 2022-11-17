#!/bin/sh
bin/zookeeper-server-start.sh -daemon config/zookeeper.properties
sleep 5
bin/kafka-server-start.sh config/server.properties