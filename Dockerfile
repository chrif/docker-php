FROM php:7.1-fpm-alpine

# https://github.com/linuxjuggler/php-7.1-xdebug-alpine

RUN apk update \
	&& apk add  --no-cache git curl libmcrypt libmcrypt-dev icu-dev \
	g++ make autoconf \
	&& docker-php-source extract \
	&& pecl install xdebug \
	&& docker-php-ext-enable xdebug \
	&& docker-php-source delete \
	&& docker-php-ext-install pdo_mysql intl opcache \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
	&& rm -rf \
		~/.composer/cache \
		/tmp/* \
		/var/cache/apk/*
