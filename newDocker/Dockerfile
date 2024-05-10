# Use the official NGINX image as the base image
#FROM nginx:alpine

# Copy custom configuration file from the current directory
#COPY nginx.conf /etc/nginx/nginx.conf
FROM debian:latest

RUN apt-get update && apt-get install -y nginx

# Remove default NGINX configuration
RUN rm -v /etc/nginx/nginx.conf

# Copy your custom NGINX configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copia tu configuración personalizada de NGINX al directorio del contenedor
#COPY nginx.conf /etc/nginx/nginx.conf

# Exponer el puerto 80
EXPOSE 8080

# Comando para iniciar NGINX en primer plano cuando se inicie el contenedor
CMD ["nginx", "-g", "daemon off;"]
