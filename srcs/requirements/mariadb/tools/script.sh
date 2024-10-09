#!/bin/bash

# Iniciar el servicio de MariaDB
service mariadb start 

# Esperar un momento para asegurarte de que MariaDB esté completamente inicializado
sleep 5

# Ejecutar comandos de configuración de la base de datos
mysql -e "FLUSH PRIVILEGES;"
mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'wordpress.srcs_inception' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'wordpress.srcs_inception';"
mysql -e "ALTER USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"

# Iniciar el servidor MariaDB en primer plano
exec mysqld