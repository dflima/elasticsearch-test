#!/usr/bin/env bash

sudo su -

apt-get update

apt-get install -y python-software-properties
add-apt-repository ppa:webupd8team/java
apt-get update -qq

echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections

apt-get install -y oracle-java8-installer
yes "" | apt-get -f install

wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.3.2/elasticsearch-2.3.2.deb
dpkg -i elasticsearch-2.3.2.deb
update-rc.d elasticsearch 95 10
/etc/init.d/elasticsearch start

echo "network.bind_host: 0" >> /etc/elasticsearch/elasticsearch.yml
echo "network.host: 0.0.0.0" >> /etc/elasticsearch/elasticsearch.yml
echo "http.cors.enabled: true" >> /etc/elasticsearch/elasticsearch.yml
echo "http.cors.allow-origin: /https?:\/\/.*/" >> /etc/elasticsearch/elasticsearch.yml

/etc/init.d/elasticsearch restart
