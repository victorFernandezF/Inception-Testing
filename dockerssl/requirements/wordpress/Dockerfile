FROM debian:bullseye

RUN apt update -y 
RUN apt install php-fpm php-mysql -y
RUN apt install curl -y

COPY ./tools/script.sh /
COPY ./conf/php-fpm.conf /

CMD [ "/script.sh" ]