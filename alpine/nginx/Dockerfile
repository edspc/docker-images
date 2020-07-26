FROM nginx:alpine

RUN set -eux; \
	adduser -u 1000 -D -S -G www-data www-data && chown -R www-data:www-data /var/www  && rm -rf /var/www/html
    
