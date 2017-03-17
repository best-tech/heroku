FROM heroku/php

#RUN pecl upgrade-all 
RUN yes | pear config-set http_proxy http://192.168.57.78:3128 \
    && pecl channel-update pecl.php.net \
    && pecl install xdebug \
    && pecl install mongodb \
    && pecl install mongo 

RUN echo "zend_extension=$(find /app/.heroku/php/ -name xdebug.so)" > /app/.heroku/php/etc/php/php.ini \
    && echo "xdebug.remote_enable=on" >> /app/.heroku/php/etc/php/php.ini \
    && echo "xdebug.remote_autostart=off" >> /app/.heroku/php/etc/php/php.ini \
    && echo "extension=mongo.so" >> /app/.heroku/php/etc/php/php.ini \
    && echo "extension=mongodb.so" >> /app/.heroku/php/etc/php/php.ini