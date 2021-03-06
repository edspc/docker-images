FROM php:7.4-fpm-alpine

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN apk add --no-cache \
      bash \
      freetype-dev \
      libjpeg-turbo-dev \
      libpng \
      icu-dev \
      libxml2-dev \
      libxslt-dev \
      libzip-dev \
      libsodium-dev \
      g++ \
      make \
      autoconf \
      oniguruma-dev \
      shadow && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install \
      dom \
      gd \
      intl \
      mbstring \
      pdo_mysql \
      xsl \
      zip \
      soap \
      bcmath \
      sockets \
      opcache && \
    pecl install xdebug libsodium && docker-php-ext-enable sodium && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    usermod -u 1000 www-data && groupmod -g 1000 www-data && \
    chown -R www-data:www-data /var/www  && rm -rf /var/www/html

USER www-data

ADD docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["php-fpm", "-F"]

EXPOSE 9000
