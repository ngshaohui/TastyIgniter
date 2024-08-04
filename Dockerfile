FROM php:8.2.22-apache

# install composer https://stackoverflow.com/a/58694421/3826254
COPY --from=composer:2.7.7 /usr/bin/composer /usr/local/bin/composer

# enable mod_rewrite
RUN a2enmod rewrite

USER www-data
COPY TastyIgniter-3.7.6.tar.gz /tmp
# use strip components to remove outermost ATutor folder
# /var/www/html/TastyIgniter/index.php becomes /var/www/html/index.php
RUN tar -xzf /tmp/TastyIgniter-3.7.6.tar.gz -C /var/www/html/ --strip-components=1

USER root
# cleanup
RUN rm /tmp/TastyIgniter-3.7.6.tar.gz
RUN rm -rf /tmp/TastyIgniter-3.7.6

# php ext zip
RUN apt-get update && apt-get install -y \
	libzip-dev zip \
	&& docker-php-ext-install zip

RUN docker-php-ext-install zip

# php ext gd
RUN apt-get update && apt-get install -y \
	libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
	&& docker-php-ext-configure gd \
	--with-freetype=/usr/include/ \
	--with-jpeg=/usr/include/ \
	&& docker-php-ext-install gd

# php ext mysql
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

# setup cron jobs

RUN apt-get update && apt-get install -y cron
COPY tastyigniter-cron /etc/cron.d/tastyigniter-cron
RUN chmod 0644 /etc/cron.d/tastyigniter-cron
RUN crontab /etc/cron.d/tastyigniter-cron

USER www-data
COPY --chown=www-data .htaccess /var/www/html/

# https://tastyigniter.com/docs/installation#installing-tastyigniter
# WORKDIR /app/mytasty/
WORKDIR /var/www/html/
RUN composer install
