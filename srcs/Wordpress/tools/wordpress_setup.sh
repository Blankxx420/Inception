alias wp="wp --allow-root"

wp core install \
 --url $DOMAIN_NAME \
 -title $WP_TITLE \
 --admin_user $ADMIN_USERNAME \
 --admin_password $ADMIN_PASSWORD \
 --admin_email $ADMIN_EMAIL \
 --locale fr_FR \
 --skip-email

if (! -f /wordpress/)
