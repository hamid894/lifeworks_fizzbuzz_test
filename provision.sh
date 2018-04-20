#!/usr/bin/env bash

yum -y update > /dev/null 2>&1
yum -y install httpd > /dev/null 2>&1
service httpd start
rm -rf /var/www
mkdir /var/www
ln -s /vagrant /var/www/html
echo "hello world!" > /var/www/html/index.html
