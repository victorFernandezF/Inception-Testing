FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y nginx
RUN apt-get install -y openssl

RUN mkdir /etc/nginx/certs
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/certs/server.key \
    -out /etc/nginx/certs/server.crt \
    -subj "/CN=localhost"

RUN mkdir -p /etc/nginx/certs /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]