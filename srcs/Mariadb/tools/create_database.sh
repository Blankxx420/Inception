#!/bin/bash

service mariadb start

# Drop user if exists and create new user
mysql -u root -e "DROP USER IF EXISTS '$DB_USER'@'%';"
mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"

# Create database if it doesn't exist
mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"
  
# Grant privileges to the user
mysql -u root -e "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'%';"

# Reload privileges to apply changes
mysql -u root -e "FLUSH PRIVILEGES;"

service mariadb stop

mysqld