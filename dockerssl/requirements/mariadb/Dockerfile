FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

COPY ./conf/mysqld.conf /etc/mysql/mariadb.conf.d/


COPY ./tools/mariadb.sh /
RUN chmod +x /mariadb.sh
RUN chown /mariadb.sh


CMD ["/mariadb.sh"]
