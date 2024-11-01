FROM php:8-fpm-alpine

ENV PHPGROUP=laravel
ENV PHPUSER=laravel

RUN adduser -g ${PHPGROUP} -s /bin/sh -D ${PHPUSER}

RUN sed -i "s/user = www-data/user = ${PHPUSER}/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group = www-data/group = ${PHPGROUP}/g" /usr/local/etc/php-fpm.d/www.conf

RUN mkdir -p /var/www/html/public

#RUN docker-php-ext-install pdo pdo_mysql gd

#RUN apk add libpng-dev
RUN apk update \
    && apk add libpng-dev libjpeg zlib libzip-dev libxml2-dev php83-gd

RUN docker-php-ext-install pdo pdo_mysql gd zip xml
#RUN docker-php-ext-configure gd --with-freetype --with-jpeg

RUN docker-php-ext-enable gd zip xml

CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]