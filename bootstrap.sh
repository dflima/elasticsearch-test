#!/usr/bin/env bash

ELASTICSEARCH_VERSION="1.1.1"

sudo apt-get update

echo "Installing tools and dependencies"
sudo apt-get install curl vim unzip htop -y
sudo apt-get install openjdk-7-jre-headless -y

#wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/$ELASTICSEARCH_VERSION/elasticsearch-$ELASTICSEARCH_VERSION.deb
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ELASTICSEARCH_VERSION.deb
sudo dpkg -i elasticsearch-$ELASTICSEARCH_VERSION.deb
sudo service elasticsearch start

sudo /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head

