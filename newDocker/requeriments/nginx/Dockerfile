FROM debian:latest

RUN apt-get update
RUN apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/certs /var/www/html

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/certs/server.key \
    -out /etc/nginx/certs/server.crt \
    -subj "/CN=localhost"

COPY nginx.conf /etc/nginx/nginx.conf
COPY html /var/www/html

EXPOSE 443

#docker compose up -d
#docker exec -it <nombre_del_contenedor> /bin/bash

# Iniciar el servidor Nginx
CMD ["nginx", "-g", "daemon off;"]