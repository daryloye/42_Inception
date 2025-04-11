FROM debian:bullseye

RUN apt-get update && apt-get install -y \
	php-fpm \
	php-mysql \
	curl \
	unzip

RUN mkdir -p /var/www

# download wordpress folder
RUN curl -O https://wordpress.org/latest.zip \
	&& unzip latest.zip \
	&& rm latest.zip \
	&& mv wordpress /var/www/ \
	&& chown -R www-data:www-data /var/www/wordpress

WORKDIR /var/www/wordpress
# VOLUME /var/www/wordpress

RUN ls && pwd

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]