FROM debian:latest

# Actualizar los paquetes e instalar MariaDB y otras utilidades
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client vim && \
    rm -rf /var/lib/apt/lists/*

# Asegurar que el directorio de sockets exista y tenga los permisos correctos
RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

# Exponer el puerto 3306
EXPOSE 3306

# Copiar archivos de configuración
COPY ./conf/mysqld.conf /etc/mysql/my.cnf

# Copiar el script de inicio y asegurarse de que sea ejecutable
COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh

# Usar el script de inicio personalizado
ENTRYPOINT ["/usr/local/bin/mariadb.sh"]

# Comando por defecto para iniciar MariaDB y escuchar globalmente
CMD ["mysqld", "--bind-address=0.0.0.0"]
