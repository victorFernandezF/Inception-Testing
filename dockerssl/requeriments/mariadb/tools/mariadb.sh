#!/bin/bash

# Start MariaDB service
service mariadb start

# Check if MariaDB started successfully
if [ $? -ne 0 ]; then
  echo "Failed to start MariaDB. Exiting."
  exit 1
fi

# Wait for MariaDB to start up (optional, adjust time as needed)
sleep 10

# Create the database if it doesn't exist
mysql -uroot -p"$DB_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DB_DATABASE;"
if [ $? -ne 0 ]; then
  echo "Failed to create database $DB_DATABASE. Exiting."
  exit 1
fi

# Create the user if it doesn't exist and grant privileges
mysql -uroot -p"$DB_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
if [ $? -ne 0 ]; then
  echo "Failed to create user $DB_USER. Exiting."
  exit 1
fi

mysql -uroot -p"$DB_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USER'@'%';"
if [ $? -ne 0 ]; then
  echo "Failed to grant privileges to user $DB_USER. Exiting."
  exit 1
fi

mysql -uroot -p"$DB_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
if [ $? -ne 0 ]; then
  echo "Failed to flush privileges. Exiting."
  exit 1
fi

# Start mysqld_safe in the foreground
exec mysqld_safe
