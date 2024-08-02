# Usar la imagen base de Debian
FROM debian:latest

# Instalar Nginx y OpenSSL
RUN apt-get update && apt-get install -y nginx openssl

# Crear los directorios necesarios
RUN mkdir -p /etc/nginx/certs /var/www/html

# Generar certificados SSL autogenerados
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/certs/server.key \
    -out /etc/nginx/certs/server.crt \
    -subj "/CN=localhost"

# Copiar los archivos de configuración y contenido
COPY nginx.conf /etc/nginx/nginx.conf
COPY html /var/www/html

# Exponer el puerto 443 para HTTPS
EXPOSE 443

# Iniciar el servidor Nginx
CMD ["nginx", "-g", "daemon off;"]