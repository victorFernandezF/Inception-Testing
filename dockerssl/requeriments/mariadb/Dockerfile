FROM debian:latest

RUN apt-get update && apt-get install -y mariadb-server

COPY conf/mariadb.conf /etc/mysql/my.cnf
COPY tools/mariadb.sh /

CMD ["/mariadb.sh"]
