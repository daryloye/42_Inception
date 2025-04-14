FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    curl \
    unzip \
    mariadb-client

RUN mkdir -p /var/www
WORKDIR /var/www

# Download wordpress folder
RUN curl -O https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    rm latest.zip && \
    mv wordpress/* . && \
    rm -rf wordpress && \
    chown -R www-data:www-data .

# Configure PHP-FPM to listen on TCP instead of Unix socket
RUN mkdir -p /run/php \
  && sed -i 's|^listen = .*|listen = 9000|' /etc/php/*/fpm/pool.d/www.conf

COPY tools/* /
RUN chmod +x /entrypoint.sh

EXPOSE 9000

CMD ["/entrypoint.sh"]
