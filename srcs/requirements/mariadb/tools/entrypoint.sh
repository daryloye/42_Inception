#!/bin/bash

set -e

chown -R mysql:mysql /var/
chown -R mysql:mysql /run/
chmod 777 /var/
chmod 777 /run/

# Install MariaDB (for first time use)
echo "Installing MariaDB..."
mariadb-install-db --datadir=/var/lib/mysql

# Start MariaDB
echo "Starting MariaDB..."
mariadbd-safe &
MYSQL_PID=$!

# Wait for MariaDB to be ready
echo "Waiting for MariaDB to be ready..."
until mysqladmin ping -p"$MYSQL_ROOT_PASSWORD" > /dev/null 2>&1; do
    sleep 1
    echo "Still waiting..."
done

# Run the SQL initialization script
echo "Running SQL script"
cat << EOF > /init.sql
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

mariadb -u root -p"$MYSQL_ROOT_PASSWORD" < /init.sql

echo "MariaDB is ready"

# Keep container alive
wait $MYSQL_PID
