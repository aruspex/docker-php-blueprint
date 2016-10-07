FROM composer/composer:1.2
MAINTAINER Anton Petrenko <arspex@gmail.com>

COPY docker-entrypoint.sh /usr/local/bin

ENV COMPOSER_USER composer

RUN useradd -u 1000 -U $COMPOSER_USER && \
    chown -R $COMPOSER_USER:$COMPOSER_USER /app /composer

USER $COMPOSER_USER

ENTRYPOINT ["docker-entrypoint.sh"]