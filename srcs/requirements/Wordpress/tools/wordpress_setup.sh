#!/bin/bash

# Ensure the correct directory and ownership
mkdir -p /var/www/html
chown -R www-data:www-data /var/www/html

# Check if required environment variables are set
if [ -z "$DB_NAME" ] || [ -z "$DB_USER" ] || [ -z "$DB_PASS" ] || [ -z "$DB_HOST" ] || [ -z "$DOMAIN_NAME" ] || [ -z "$WP_TITLE" ] || [ -z "$ADMIN_USERNAME" ] || [ -z "$ADMIN_PASSWORD" ] || [ -z "$ADMIN_EMAIL" ]; then
    echo "Error: One or more required environment variables are missing."
    exit 1
fi

# Ensure WordPress is downloaded if not present
wp core download --path="/var/www/html/"  --force --allow-root || { echo "Error downloading WordPress."; exit 1; }

rm -rf /var/www/html/wp-config.php
cd /var/www/html/
# Check if wp-config.php does not exist, then create it
if [ ! -f /var/www/html/wp-config.php ]; then
    echo "Creating wp-config.php..."
    wp config create \
        --allow-root \
        --dbname="$DB_NAME" \
        --dbuser="$DB_USER" \
        --dbpass="$DB_PASS" \
        --dbhost="$DB_HOST" \
        --skip-check \

    # Install WordPress
    echo "Installing WordPress..."
    echo "Setting correct file permissions..."
    chown -R www-data:www-data /var/www/html
    find /var/www/html -type d -exec chmod 755 {} \;
    find /var/www/html -type f -exec chmod 644 {} \;

    wp config set WP_DEBUG 'true' --allow-root
    wp config set FORCE_SSL_ADMIN 'false' --allow-root
    wp config  set WP_REDIS_HOST 'redis' --allow-root
    wp config set WP_REDIS_PORT $redis_port --allow-root
    wp config  set WP_CACHE 'true' --allow-root
    wp plugin install redis-cache --allow-root
    wp plugin activate redis-cache --allow-root
    wp redis enable --allow-root
        chmod 777 /var/www/html/wp-content
    wp core install \
        --allow-root \
        --path="/var/www/html/" \
        --url="$DOMAIN_NAME" \
        --title="$WP_TITLE" \
        --admin_user="$ADMIN_USERNAME" \
        --admin_password="$ADMIN_PASSWORD" \
        --admin_email="$ADMIN_EMAIL" \
        --skip-email
else
    echo "wp-config.php already exists. Skipping creation."
fi
# Start PHP-FPM (you can replace with your PHP version)
echo "Starting PHP-FPM..."
/usr/sbin/php-fpm7.4 -F