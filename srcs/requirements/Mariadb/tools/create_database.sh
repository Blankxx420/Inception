#!/bin/bash

# Make sure the directory exists
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

# Initialize the database if it doesn't exist
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Start MariaDB in the background
mysqld_safe --datadir=/var/lib/mysql &

# Wait for MariaDB to be ready
until mysqladmin ping -h localhost --silent; do
    echo "Waiting for database server to be ready..."
    sleep 2
done

echo "MariaDB started successfully"

# Create database and user
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

echo "Database and user created"

# Stop the background process
mysqladmin -u root shutdown

echo "Starting MariaDB in foreground"
# Start MariaDB in the foreground
exec mysqld --user=mysql --console