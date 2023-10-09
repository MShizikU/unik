FROM php:7.4-apache

RUN apt-get update
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN a2enmod rewrite

WORKDIR /var/www/html

COPY ./*.php /var/www/html/
COPY ./init.sql /docker-entrypoint-initdb.d/init.sql

EXPOSE 80
