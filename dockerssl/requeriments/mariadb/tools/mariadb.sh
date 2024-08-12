mysqld_safe &

# Wait for MariaDB to start up
sleep 10

# Create the database if it doesn't exist
mysql -uroot -p"$DB_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DB_DATABASE;"

# Create the user if it doesn't exist and grant privileges
mysql -uroot -p"$DB_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -uroot -p"$DB_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USER'@'%';"
mysql -uroot -p"$DB_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

# Bring mysqld_safe to the foreground
wait