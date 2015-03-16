FROM custom/lamp:latest

RUN apt-get update && apt-get install -y \ 
	git \
	curl \
	php5-cli \
	php5-json \
	php5-intl \
	php5-xdebug \
	php5-curl \
	php5-pgsql

RUN curl -sS https://getcomposer.org/installer | php

RUN mv composer.phar /usr/local/bin/composer

# Install MongoDB.
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org && \
  rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \ 
	php5-mongo

#RUN sh -c 'echo "extension=mongo.so" > /etc/php5/conf.d/mongo.ini'