FROM php:7.0-fpm-alpine
RUN apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev imap-dev openssl-dev zlib-dev libxml2-dev && \
  docker-php-ext-configure gd \
    --with-gd \
    --with-freetype-dir=/usr/include/ \
    --with-png-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ && \
  NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
  docker-php-ext-install -j${NPROC} gd && \
  docker-php-ext-configure imap --with-imap --with-imap-ssl && \
  docker-php-ext-install imap && \
  docker-php-ext-install pdo pdo_mysql && \
  docker-php-ext-install zip && \
  docker-php-ext-configure soap --enable-soap && \
  docker-php-ext-install soap && \
  #docker-php-ext-configure ldap --with-libdir=lib/ && \
  #docker-php-ext-install ldap && \
  apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev
