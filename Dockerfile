FROM php:5.6-fpm-alpine

RUN docker-php-ext-install mysql mysqli

RUN apt-get update
