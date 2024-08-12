#!/bin/bash

# we have to start the mariadb so we can create the databases
service mariadb start

mysql -e "create database if not exists $DB_DATABASE;"
mysql -e "create user if not exists '$DB_USER'@'%' identified by '$DB_PASSWORD';"
mysql -e "grant all privileges on $DB_DATABASE.* TO '$DB_USER'@'%';"
mysql -e "flush privileges;"

# kill any mysql daemon instance running
pkill -f mysqld

# start the daemon again
mysqld