FROM debian:bullseye

# Actualizar los paquetes e instalar MariaDB
RUN apt-get update && apt-get install -y mariadb-server

# Copiar archivos de configuración y script
COPY conf/mysqld.conf /etc/mysql/my.cnf
COPY tools/mariadb.sh /mariadb.sh
RUN chmod +x /mariadb.sh

# Crear y asegurar los directorios necesarios
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql

# Exponer el puerto MariaDB
EXPOSE 3306

# Comando para iniciar el script que arranca MariaDB
CMD ["/mariadb.sh"]
