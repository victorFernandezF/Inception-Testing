FROM debian:bullseye

RUN apt-get update -y && apt-get install -y mariadb-server

COPY ./tools/script.sh /
COPY ./tools/.env /.env
COPY ./conf/my.cnf /etc/mysql/my.cnf

RUN chmod +x script.sh

EXPOSE 3306

CMD ["/script.sh"]