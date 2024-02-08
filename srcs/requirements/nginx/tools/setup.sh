#!/bin/bash



openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $SSL_KEY_PATH/$DOMAIN_NAME.key -out $SSL_CERTS_PATH/$DOMAIN_NAME.crt -subj $SUBJECT_FIELDS

echo "server {
    listen 443 ssl;
    listen [::]:443 ssl;

    ssl_certificate $SSL_CERTS_PATH/$DOMAIN_NAME.crt;
    ssl_certificate_key $SSL_KEY_PATH/$DOMAIN_NAME.key;
	ssl_protocols TLSv1.3;
	
	root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

	server_name $DOMAIN_NAME www.$DOMAIN_NAME;
 
}" > /etc/nginx/sites-available/default

nginx -g "daemon off;"