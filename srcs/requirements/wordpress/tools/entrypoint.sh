#!/bin/bash

set -e

cd /var/www

# Create wp-config.php if it doesn't exist
if [ ! -f wp-config.php ]; then
  echo "Generating wp-config.php..."

  cp wp-config-sample.php wp-config.php

  sed -i "s/database_name_here/${WORDPRESS_DB_NAME}/" wp-config.php
  sed -i "s/username_here/${WORDPRESS_DB_USER}/" wp-config.php
  sed -i "s/password_here/${WORDPRESS_DB_PASSWORD}/" wp-config.php
  sed -i "s/localhost/${WORDPRESS_DB_HOST}/" wp-config.php

  chown www-data:www-data wp-config.php
fi

# Start PHP-FPM in foreground
exec php-fpm7.4 -F
