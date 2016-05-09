#!/usr/bin/env bash

ELASTICSEARCH_VERSION="1.1.1"

sudo apt-get update

sudo apt-get install curl vim -y
sudo apt-get install openjdk-7-jre-headless -y

#wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/$ELASTICSEARCH_VERSION/elasticsearch-$ELASTICSEARCH_VERSION.deb
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ELASTICSEARCH_VERSION.deb
sudo dpkg -i elasticsearch-$ELASTICSEARCH_VERSION.deb
sudo service elasticsearch start

sudo /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head

curl -XPOST 'http://localhost:9200/megacorp/employee/1' -d '
{
   "first_name": "John",
   "last_name": "Smith",
   "age": 25,
   "about": "I love to go rock climbing",
   "interests": [
      "sports",
      "music"
   ]
}'

curl -XPOST 'http://localhost:9200/megacorp/employee/2' -d '
{
   "first_name": "Jane",
   "last_name": "Smith",
   "age": 32,
   "about": "I like to collect rock albums",
   "interests": [
      "music"
   ]
}'

curl -XPOST 'http://localhost:9200/megacorp/employee/3' -d '
{
   "first_name": "Douglas",
   "last_name": "Fir",
   "age": 35,
   "about": "I like to build cabinets",
   "interests": [
      "forestry"
   ]
}'
