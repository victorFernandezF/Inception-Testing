FROM debian:latest

# Actualizar la lista de paquetes e instalar Nginx
RUN apt-get update && apt-get install -y nginx

# Copiar el archivo index.html al directorio de Nginx
COPY ./html /var/www/html

# Exponer el puerto 80 para acceder al servidor
EXPOSE 80

# Iniciar el servidor Nginx
CMD ["nginx", "-g", "daemon off;"]