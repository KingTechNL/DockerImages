#!/bin/sh

envsubst < /nginx.conf.tmpl > /etc/nginx/nginx.conf
nginx-debug "-g", "daemon off;"