FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

COPY ./conf/mysqld.cnf /etc/mysql/mariadb.conf.d/


COPY ./tools/mariadb.sh /


CMD ["/mariadb.sh"]
