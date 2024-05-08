FROM	debian:latest

#install all the program
RUN		apt-get update
RUN		apt-get install -y nginx 



#the only port allowed
EXPOSE	4433

# Start nginx
CMD ["nginx", "-g", "daemon off;"]