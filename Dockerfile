FROM php:5.6-fpm-alpine

RUN docker-php-ext-install mysql mysqli

RUN apt-get update -y

RUN apt-get install -y sendmail

RUN apt-get install -y libpng-dev

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev 

RUN docker-php-ext-install mbstring

RUN docker-php-ext-install zip

RUN docker-php-ext-install gd
