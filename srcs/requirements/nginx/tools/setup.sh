#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $SSL_KEY_PATH/$DOMAIN_NAME.key -out $SSL_CERTS_PATH/$DOMAIN_NAME.crt -subj $SUBJECT_FIELDS

echo "server {
    listen 443 ssl;
    listen [::]:443 ssl;

    ssl_certificate $SSL_CERTS_PATH/$DOMAIN_NAME.crt;
    ssl_certificate_key $SSL_KEY_PATH/$DOMAIN_NAME.key;
	ssl_protocols TLSv1.3;
	
	root /var/www/html;
    index index.php

	server_name $DOMAIN_NAME www.$DOMAIN_NAME;

    location ~ \.php$ {
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass wordpress:9000;
    fastcgi_index index.php;
    include fastcgi_params;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    fastcgi_param SCRIPT_NAME $fastcgi_script_name;
  }
 
}" > /etc/nginx/sites-available/default

nginx -g "daemon off;"