#!/bin/sh

envsubst \$USER_DOMAIN < /nginx.conf.tmpl > /etc/nginx/nginx.conf
nginx-debug '-g' 'daemon off;'