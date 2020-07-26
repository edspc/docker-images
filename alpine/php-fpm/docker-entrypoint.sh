#!/bin/sh

if [ "$XDEBUG_ENABLED" = "true" ] ; then \
    echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini;
fi ;

exec "$@"
