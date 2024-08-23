# Usa la imagen base oficial de Debian Bullseye
FROM debian:bullseye

# Instala las dependencias y MariaDB
RUN apt-get update -y && \
    apt-get install -y \
    gnupg \
    lsb-release \
    && apt-get clean

# Añade la clave de firma y el repositorio de MariaDB
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xF1656F24C74CD1D8 && \
    echo "deb [arch=amd64] http://mirror.jmu.edu/pub/mariadb/repo/10.11/debian bullseye main" | tee /etc/apt/sources.list.d/mariadb.list

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
