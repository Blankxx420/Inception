alias wp="wp --allow-root"

wp core install \
    --url $DOMAIN_NAME \
    --title $WP_TITLE \
    --admin_user $ADMIN_USERNAME \
    --admin_password $ADMIN_PASSWORD \
    --admin_email $ADMIN_EMAIL \
    --locale fr_FR \
    --skip-email

if (! -f /wordpress/wp-config.php)
then
    wp config create \
        --dbname $DB_NAME \
        --dbuser $DB_USER \
        --dbpass $DB_PASS \
        --dbhost mariadb:3306 \

fi
