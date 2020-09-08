FROM nginx:alpine

RUN set -eux; \
    rm -rf /var/www/ && \
    adduser --uid 1000 --home /var/www --system --ingroup www-data www-data
