# Use the Alpine Linux base image
FROM alpine:latest

# Install Nginx and OpenSSL
RUN apk update && apk add nginx openssl

# Copy SSL certificate and key files into the container
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 
-keyout /etc/nginx/nginx.key 
-out /etc/nginx/nginx.crt 
-subj "/C=US/ST=CA/L=SanFrancisco/O=MyOrg/OU=MyUnit/CN=mydomain.com"

# Replace default Nginx configuration with custom configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose ports 80 (HTTP) and 443 (HTTPS)
EXPOSE 80
EXPOSE 443

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]