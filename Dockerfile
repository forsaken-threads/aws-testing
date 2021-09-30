FROM php:7.4-fpm-alpine3.13

# Install dependencies
RUN apk update && apk upgrade && apk add \
    nginx tzdata less vim bash openssl

WORKDIR /var/www

# Copy files
COPY . /var/www

COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

RUN touch /run/nginx.pid \
    && chown -R www-data:www-data /var/www \
    && chown www-data:www-data /run/nginx.pid \
    && chown -Rf www-data:www-data /var/lib/nginx

RUN ["chmod", "+x", "post_deploy.sh"]

CMD [ "sh", "./post_deploy.sh" ]
