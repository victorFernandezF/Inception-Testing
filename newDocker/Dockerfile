# Usar la imagen base de Debian
FROM debian:latest

# Actualizar la lista de paquetes e instalar Nginx y OpenSSL
RUN apt-get update && apt-get install -y nginx openssl

# Copiar los archivos de configuración de Nginx y los certificados
COPY nginx.conf /etc/nginx/nginx.conf
COPY certs /etc/nginx/certs/
COPY html /var/www/html

# Exponer el puerto 443 para HTTPS
EXPOSE 443

# Iniciar el servidor Nginx
CMD ["nginx", "-g", "daemon off;"]