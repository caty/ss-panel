FROM richarvey/nginx-php-fpm

ENV SSPANEL_VERSION 4.0.0
WORKDIR /var/www/html

# Install sspanel
COPY . /var/www/html
COPY nginx.conf /etc/nginx/sites-enabled/sspanel.conf


# Install Composer
RUN cd /var/www/html && composer install --no-scripts \
    && chmod -R 777 storage && rm /etc/nginx/sites-enabled/default.conf

# Entrypoint
COPY docker-entrypoint.sh /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/start.sh"]
