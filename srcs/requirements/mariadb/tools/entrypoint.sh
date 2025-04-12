#!/bin/bash

# Start MariaDB using mysqld_safe
echo "Starting MariaDB..."
mariadbd-safe &
MYSQL_PID=$!

# Wait for MariaDB to be ready
echo "Waiting for MariaDB to be ready..."
until mariadb-admin ping -h 127.0.0.1 -p"$MYSQL_ROOT_PASSWORD" > /dev/null 2>&1; do
    sleep 1
    echo "Still waiting..."
done

# Run the SQL initialization script
echo "Running init.sql..."
mariadb -u root -p"$MYSQL_ROOT_PASSWORD" -h 127.0.0.1 < /init.sql

# Keep container alive
wait $MYSQL_PID
