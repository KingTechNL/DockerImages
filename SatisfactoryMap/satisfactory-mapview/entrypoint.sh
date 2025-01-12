#!/bin/sh

envsubst \$DOMAIN_NAME,\$SCHEME < /nginx.conf.tmpl > /etc/nginx/nginx.conf
nginx-debug '-g' 'daemon off;'
cron '-f'