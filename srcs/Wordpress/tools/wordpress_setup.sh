#!/bin/bash

# Ensure WordPress is downloaded first
if [ -z "$( ls -A '/var/www/html/' )" ]; then
    wp core download --path="/var/www/html/" --allow-root
fi

# Check if wp-config.php does not exist
if [ ! -f /var/www/html/wp-config.php ]; then
    wp config create \
        --allow-root \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass=$DB_PASS \
        --dbhost=$DB_HOST \
        --path="/var/www/html/"

	wp core install \
	--allow-root \
	--path="/var/www/html/" \
    --url=$DOMAIN_NAME \
    --title=$WP_TITLE \
    --admin_user=$ADMIN_USERNAME \
    --admin_password=$ADMIN_PASSWORD \
    --admin_email=$ADMIN_EMAIL \
    --locale fr_FR \
    --skip-email
fi
