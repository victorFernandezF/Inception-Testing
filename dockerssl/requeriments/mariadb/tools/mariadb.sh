#!/bin/bash

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

# Start MariaDB service
service mariadb start

# Wait for MariaDB to start up (optional, adjust time as needed)
sleep 10

# Create the database if it doesn't exist
mysql -uroot -p"$DB_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DB_DATABASE;"

# Create the user if it doesn't exist and grant privileges
mysql -uroot -p"$DB_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -uroot -p"$DB_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USER'@'%';"
mysql -uroot -p"$DB_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

# Instead of killing and restarting mysqld, let it run in the foreground
# To allow for this, don't stop the service; just leave it running
# This should be the last command so the container stays alive
mysqld_safe
