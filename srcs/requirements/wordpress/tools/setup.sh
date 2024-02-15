#!/bin/bash

# Check if WordPress is already installed and set up
if [ -f "/var/www/html/wp-config.php" ]; then
    echo "WordPress already installed and set up"
else
    # Create necessary directory and clean its contents
    mkdir -p var/www/html
    rm -rf var/www/html/*

    # Navigate to the WordPress directory
    cd var/www/html

    # Download WP-CLI
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
    chmod +x wp-cli.phar
    mv /var/www/html/wp-cli.phar /usr/local/bin/wp

    # Download and configure WordPress
    wp core download --allow-root
    mv /wp-config.php /var/www/html/wp-config.php

    # Replace placeholder values in wp-config.php with actual database credentials
    sed -i -r "s/%DB_NAME%/$DB_NAME/1" wp-config.php
    sed -i -r "s/%DB_USER%/$DB_USER/1" wp-config.php
    sed -i -r "s/%DB_PASSWORD%/$DB_PASSWORD/1" wp-config.php

    # Install WordPress
    wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

    # Create an additional user with 'author' role
    wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_ADMIN_PASSWORD --allow-root

    # Install and activate a default theme
    wp theme install twentysixteen --activate --allow-root

    # Update all plugins
    wp plugin update --all --allow-root

    # Ensure correct ownership and permissions
    chown -R www-data:www-data /var/www/html
    find /var/www/html -type d -exec chmod 755 {} \;
    find /var/www/html -type f -exec chmod 644 {} \;

    # Configure PHP-FPM to listen on port '9000'
    sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

    # Create directory for PHP-FPM
    mkdir /run/php
fi

# Start PHP-FPM
echo "executing php-fpm"
exec /usr/sbin/php-fpm7.3 -F
