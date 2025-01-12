#!/bin/sh

echo "Creating nginx config for: ${SCHEME}://${DOMAIN_NAME}"
envsubst \$DOMAIN_NAME,\$SCHEME < /nginx.conf.tmpl > /etc/nginx/nginx.conf

echo "Starting NGinx server..."
nginx-debug '-g' 'daemon off;'

echo "Starting cron job..."
cron '-f'

echo "Container started!"