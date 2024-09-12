FROM debian:bullseye

RUN apt-get update -y && apt-get install -y mariadb-server

COPY ./tools/script.sh /
COPY ./conf/mysqld.conf /etc/mysql/my.cnf
COPY ./tools/.env /.env

RUN chmod +x script.sh
# Ensure directories exist and have the correct permissions
#RUN mkdir -p /var/run/mysqld && chown mysql:mysql /var/run/mysqld

# Start MariaDB directly using the mysqld command
CMD ["/script.sh"]