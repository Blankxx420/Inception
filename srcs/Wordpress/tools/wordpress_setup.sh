#!/bin/bash

sleep 10

# Ensure WordPress is downloaded first
wp core download --path="/var/www/html/" --allow-root


# Check if wp-config.php does not exist
if [ ! -f /var/www/html/wp-config.php ]; then
    wp config create \
        --allow-root \
		--force \
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
