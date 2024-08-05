FROM debian:latest

RUN apt-get update
RUN apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/certs /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY html /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]