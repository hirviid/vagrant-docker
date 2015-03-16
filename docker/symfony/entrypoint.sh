#!/bin/bash -e

if [ ! -d /var/www ]; then
	echo 'No application found in /var/www'
	exit 1;
fi

cd /var/www

if [ ! -d vendor ]; then
	composer install
fi