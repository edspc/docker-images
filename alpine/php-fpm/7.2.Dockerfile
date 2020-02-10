FROM php:7.2-fpm-alpine

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN apk add --no-cache \
        bash \
		freetype-dev \
        libjpeg-turbo-dev \
        libpng \
		icu-dev \
		libxml2-dev \
		libxslt-dev \
		libsodium-dev \
		g++ \
		make \
		autoconf \
        shadow

RUN docker-php-ext-configure \
  gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

# Install required PHP extensions
RUN docker-php-ext-install \
  dom \
  gd \
  intl \
  mbstring \
  pdo_mysql \
  xsl \
  zip \
  soap \
  bcmath \
  opcache

RUN yes | pecl install xdebug libsodium \
    && docker-php-ext-enable xdebug sodium \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN usermod -u 1000 www-data && groupmod -g 1000 www-data && \
        chown -R www-data:www-data /var/www  && rm -rf /var/www/html

USER www-data