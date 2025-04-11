#!/bin/bash
set -e

# Start MariaDB in the background
mysqld_safe &

# Wait until MariaDB is ready (10s timeout)
for i in {1..30}; do
    if mysqladmin ping --silent; then
        echo "✅ MariaDB is ready."
        break
    fi
    echo "Waiting for MariaDB..."
    sleep 1
done

# Run SQL if available
if [ -f /init.sql ]; then
    echo "⏳ Running init.sql..."
    mysql < /init.sql || { echo "❌ Failed to run init.sql"; exit 1; }
else
    echo "⚠️ No init.sql found."
fi

# Keep the DB running in foreground
exec mysqld_safe
