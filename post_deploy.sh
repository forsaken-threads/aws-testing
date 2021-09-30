#!/bin/sh

# start the application
php-fpm -D &&  nginx -g "pid /run/nginx.pid; daemon off;"

