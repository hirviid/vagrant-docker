# https://speakerdeck.com/ubermuda/a-multi-container-symfony2-setup-with-docker
FROM custom/lamp:latest

RUN apt-get update && apt-get install -y \ 
	git \
	curl \
	php5-cli \
	php5-json \
	php5-intl \
	php5-xdebug \
	php5-curl

RUN curl -sS https://getcomposer.org/installer | php

RUN mv composer.phar /usr/local/bin/composer

ADD entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod 700 /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]