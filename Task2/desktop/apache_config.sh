#!/bin/bash

mkdir /var/www/FlaskApp
cd /var/www/FlaskApp
mkdir static templates


cp /__init__.py /var/www/FlaskApp
cp /index.html /var/www/FlaskApp/templates

a2enmod proxy
a2enmod proxy_http
a2enmod lbmethod_byrequests
a2enmod wsgi

a2ensite FlaskApp.conf
a2dissite 000-default.conf

service apache2 restart
