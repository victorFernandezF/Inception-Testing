# Usa la imagen base oficial de Debian Bullseye
FROM debian:bullseye

# Instala las dependencias necesarias
RUN apt-get update -y && \
    apt-get install -y \
    gnupg \
    lsb-release \
    && apt-get clean

# Añade la clave de firma y el repositorio de MariaDB
RUN apt-get install -y software-properties-common && \
    wget -O - https://mariadb.org/mariadb_release_signing_key.asc | apt-key add - && \
    echo "deb [arch=amd64] http://mirror.jmu.edu/pub/mariadb/repo/10.11/debian bullseye main" > /etc/apt/sources.list.d/mariadb.list

# Actualiza el repositorio e instala MariaDB
RUN apt-get update -y && \
    apt-get install -y mariadb-server && \
    apt-get clean

# Copia el archivo de configuración personalizado
COPY ./conf/mysqld.conf /etc/mysql/mariadb.conf.d/50-server.cnf

# Asegúrate de que el directorio para los archivos de PID y sockets exista y tenga los permisos correctos
RUN mkdir -p /var/run/mysqld && chown mysql:mysql /var/run/mysqld && \
    mkdir -p /var/lib/mysql && chown mysql:mysql /var/lib/mysql

# Expone el puerto 3306 para la base de datos
EXPOSE 3306

# Usa el comando predeterminado para iniciar el servidor MariaDB
CMD ["mysqld"]
