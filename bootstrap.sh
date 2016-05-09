#!/usr/bin/env bash

ELASTICSEARCH_VERSION="1.1.1"

sudo apt-get update

echo "Installing tools and dependencies"
sudo apt-get install curl vim unzip htop -y
sudo apt-get install openjdk-7-jre-headless -y

if [ ! -f elasticsearch-$ELASTICSEARCH_VERSION.zip ]; then
    echo "Downloading Elasticsearch ($ELASTICSEARCH_VERSION)"
    wget -o /dev/null https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ELASTICSEARCH_VERSION.zip
fi

if [ ! -d elasticsearch-$ELASTICSEARCH_VERSION ]; then
    unzip elasticsearch-$ELASTICSEARCH_VERSION
fi

cd elasticsearch-$ELASTICSEARCH_VERSION

echo "Installing Head Plugin on Elasticsearch"
sudo ./bin/plugin -install mobz/elasticsearch-head > /dev/null

echo "Starting Elasticsearch ($ELASTICSEARCH_VERSION)"
./bin/elasticsearch -d
