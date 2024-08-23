#!/bin/bash
set -e

# Ensure the MariaDB directories have the correct ownership
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

# If /var/lib/mysql is empty, initialize the database directory
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB database..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql --rpm
fi

# Start MariaDB server in the background
mysqld_safe &
sleep 10 # Wait for MariaDB to start

# Create database and user using environment variables
echo "Creating database and user..."
mysql -u root -p"$DB_ROOT_PASSWORD" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS $DB_DATABASE;
    CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
    GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USER'@'%';
    ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
    FLUSH PRIVILEGES;
EOSQL

# Stop background MariaDB server process (started by mysqld_safe)
pkill mysqld

# Start MariaDB server in the foreground
exec mysqld