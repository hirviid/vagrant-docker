#!/bin/bash -e

if [ ! -d /var/www ]; then
	echo 'No application found in /var/www'
	exit 1;
fi

cd /var/www

if [ ! -d node_modules ]; then
	npm install
fi

if [ ! -d src/vendor/bower_components ]; then
	bower install
fi

# /bin/bash
grunt serve