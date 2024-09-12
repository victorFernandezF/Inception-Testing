FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y nginx
RUN apt-get install -y openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -sha256 -nodes \
    -days 700 -newkey rsa:4096 \
    -out /etc/nginx/ssl/victofer.crt \
    -keyout /etc/nginx/ssl/victofer.key \
    -subj "/C=ES/ST=Espanya/L=Malaga/O=42 School/OU=victofer/CN=victofer.42.fr"


COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]