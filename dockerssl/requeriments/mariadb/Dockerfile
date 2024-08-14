FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY conf/mysqld.conf /etc/mysql/my.cnf
COPY tools/mariadb.sh /
RUN chmod +x /mariadb.sh


CMD ["/bin/bash"]
