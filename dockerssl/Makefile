all : up

exec-nginx:
	@docker-compose -f ./docker-compose.yml down --rmi all 
	@docker-compose -f ./docker-compose.yml up -d
	@docker-compose exec nginx /bin/bash

exec-mariadb:
	@docker-compose -f ./docker-compose.yml down --rmi all 
	@docker-compose -f ./docker-compose.yml up -d
	@docker-compose exec mariadb /bin/bash

exec-wordpress:
	@docker-compose -f ./docker-compose.yml down --rmi all 
	@docker-compose -f ./docker-compose.yml up -d
	@docker-compose exec wordpress /bin/bash


build : 
	@docker-compose -f ./docker-compose.yml up --build

delete:
	@docker-compose -f ./docker-compose.yml down --rmi all 
	@docker-compose down --remove-orphans 

up : 
	@docker-compose -f ./docker-compose.yml up -d

down : 
	@docker-compose -f ./docker-compose.yml down

stop : 
	@docker-compose -f ./docker-compose.yml stop

start : 
	@docker-compose -f ./docker-compose.yml start

status : 
	@docker ps