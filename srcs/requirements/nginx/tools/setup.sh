#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $SSL_KEY_PATH/$DOMAIN_NAME.key -out $SSL_CERTS_PATH/$DOMAIN_NAME.crt -subj $SUBJECT_FIELDS

echo "server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name $DOMAIN_NAME www.$DOMAIN_NAME;

    ssl_protocols TLSv1.3;
    ssl_certificate $SSL_CERTS_PATH/$DOMAIN_NAME.crt;
    ssl_certificate_key $SSL_KEY_PATH/$DOMAIN_NAME.key;
	
    root /var/www/html;
    index index.php index.nginx-debian.html;

    location ~ [^/]\\.php(/|$) {
        try_files \$uri =404;
        fastcgi_pass wordpress:9000;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
    }
}" > /etc/nginx/sites-available/default

exec nginx -g "daemon off;"