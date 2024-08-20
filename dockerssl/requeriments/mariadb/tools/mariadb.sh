#!/bin/bash

# Crear el directorio de ejecución de mysqld y establecer permisos
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

# Iniciar MariaDB en modo seguro en primer plano
mysqld_safe --datadir='/var/lib/mysql' &

# Esperar a que MariaDB se inicie (ajustar el tiempo si es necesario)
sleep 10

# Crear la base de datos y usuario si no existen
mysql -uroot -p"$DB_ROOT_PASSWORD" <<-EOSQL
CREATE DATABASE IF NOT EXISTS $DB_DATABASE;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOSQL

# Mantener MariaDB corriendo en primer plano
wait
