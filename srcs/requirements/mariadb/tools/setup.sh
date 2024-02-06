#!/bin/bash

db_name=db
db_user=pmolnar
db_pwd=abc123abc

service mariadb start

until mysqladmin ping -hlocalhost --silent; do
    echo "Waiting for MySQL service to start..."
    sleep 5
done

echo "CREATE DATABASE IF NOT EXISTS $db_name ;" > init_db.cmd
echo "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pwd' ;" >> init_db.cmd
echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' ;" >> init_db.cmd
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> init_db.cmd
echo "FLUSH PRIVILEGES;" >> init_db.cmd

mysql -u root < init_db.cmd

# kill $(cat /var/run/mysqld/mysqld.pid)

mysqld