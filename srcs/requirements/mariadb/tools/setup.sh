#!/bin/bash

if [ -d "/var/lib/mysql/$DB_NAME" ]

then 
	echo "Database already exists"

else

service mysql start
until mysqladmin ping -hlocalhost --silent; do
    echo "Waiting for MySQL service to start..."
    sleep 5
done

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > init_db.cmd
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;" >> init_db.cmd
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> init_db.cmd
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> init_db.cmd
echo "FLUSH PRIVILEGES;" >> init_db.cmd

mysql < init_db.cmd

sleep 3

service mysql stop

fi

echo "executing mysql daemon"
exec mysqld
