#!/bin/sh

#get into temp directory to provision httpd template
cd /tmp/
wget "https://www.tooplate.com/zip-templates/2132_clean_work.zip"
unzip -o 2132_clean_work.zip

###########################################################

#coping template content to htttpd default server directory
cp -r 2132_clean_work/* /usr/share/nginx/html/

###########################################################

