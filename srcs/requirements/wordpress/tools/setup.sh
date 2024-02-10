#!/bin/bash

mkdir -p var/www/html
rm -rf var/www/html/*

cd var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar

mv /var/www/html/wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv /wp-config.php /var/www/html/wp-config.php

sed -i -r "s/%DB_NAME%/$DB_NAME/1" wp-config.php
sed -i -r "s/%DB_USER%/$DB_USER/1" wp-config.php
sed -i -r "s/%DB_PASSWORD%/$DB_PASSWORD/1" wp-config.php

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_ADMIN_PASSWORD --allow-root

wp theme install twentysixteen --activate --allow-root

wp plugin update --all --allow-root

# Ensure correct ownership and permissions
chown -R www-data:www-data /var/www/html
find /var/www/html -type d -exec chmod 755 {} \;
find /var/www/html -type f -exec chmod 644 {} \;

# Configure to to listen to port '9000' instead of a local socket
sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir /run/php

/usr/sbin/php-fpm7.3 -F