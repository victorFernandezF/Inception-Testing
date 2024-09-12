FROM debian:bullseye

RUN apt-get update -y && apt-get install -y mariadb-server

COPY ./tools/script.sh /
COPY ./tools/.env /.env
COPY ./conf/mysqld.conf /etc/mysql/my.cnf

RUN chmod +x script.sh
# Ensure directories exist and have the correct permissions
#RUN mkdir -p /var/run/mysqld && chown mysql:mysql /var/run/mysqld
EXPOSE 3306

CMD ["/script.sh"]