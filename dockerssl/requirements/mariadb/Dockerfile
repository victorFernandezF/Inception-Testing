FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

COPY ./conf/mysqld.conf /etc/mysql/mariadb.conf.d/

# Ensure directories exist and have the correct permissions
RUN mkdir -p /var/run/mysqld && chown mysql:mysql /var/run/mysqld

# Start MariaDB directly using the mysqld command
CMD ["mysqld"]