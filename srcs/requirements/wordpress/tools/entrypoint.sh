#!/bin/bash

set -e

cd /var/www

# Create wp-config.php if it doesn't exist
if [ ! -f wp-config.php ]; then
  echo "Generating wp-config.php..."

  cp wp-config-sample.php wp-config.php

  sed -i "s/database_name_here/${MYSQL_DATABASE}/" wp-config.php
  sed -i "s/username_here/${MYSQL_USER}/" wp-config.php
  sed -i "s/password_here/${MYSQL_PASSWORD}/" wp-config.php
  sed -i "s/localhost/${WORDPRESS_DB_HOST}/" wp-config.php

  chown www-data:www-data wp-config.php
fi

if ! command -v wp &> /dev/null; then
  echo "Installing wp-cli"
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
fi

wp core install \
	--url="https://$DOMAIN_NAME" \
	--title="$WORDPRESS_TITLE" \
	--admin_user="$WORDPRESS_ADMIN_USER" \
	--admin_password="$WORDPRESS_ADMIN_PASSWORD" \
	--admin_email="$WORDPRESS_ADMIN_EMAIL" \
	--allow-root

if ! wp user get "$WORDPRESS_SECOND_USER" --allow-root >/dev/null 2>&1; then
  wp user create \
	"$WORDPRESS_SECOND_USER" \
	"$WORDPRESS_SECOND_EMAIL" \
	--user_pass="$WORDPRESS_SECOND_PASSWORD" \
	--role=subscriber \
	--allow-root
fi

echo "Wordpress is ready"

# Start PHP-FPM in foreground
echo "Starting PHP-FPM"
exec php-fpm7.4 -F
