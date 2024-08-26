FROM debian:bullseye

RUN apt update -y 
RUN apt install php-fpm php-mysql -y
RUN apt install curl -y

COPY ./tools/wordpress.sh /
COPY ./conf/php-fpm.conf /

RUN chmod 777 /wordpress.sh

CMD [ "/wordpress.sh" ]