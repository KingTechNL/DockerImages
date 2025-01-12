#!/bin/sh

echo "Creating nginx config for: ${SCHEME}://${USER_DOMAIN}"
envsubst '$USER_DOMAIN,$SCHEME' < /nginx.conf.tmpl > /etc/nginx/nginx.conf

echo "Starting cron..."
cron -f

echo "Starting nginx..."
nginx-debug '-g' 'daemon off;'
/docker-entrypoint.sh "$@"