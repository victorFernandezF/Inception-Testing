FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY conf/mysqld.conf /etc/mysql/my.cnf
COPY tools/mariadb.sh /
RUN chmod +x /mariadb.sh

RUN chown -R mysql:mysql /etc/mysql/my.cnf
RUN chown -R mysql:mysql /var/lib/mysql
RUN mkdir /run/mysqld

CMD ["/mariadb.sh"]
