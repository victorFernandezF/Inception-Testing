all : up

build : 
	@docker-compose -f ./srcs/docker-compose.yml up --build

delete:
	@docker-compose -f ./srcs/docker-compose.yml down --rmi all
	@docker-compose -f ./srcs/docker-compose.yml down --remove-orphans

up : 
	@docker-compose -f ./srcs/docker-compose.yml up -d

down : 
	@docker-compose -f ./srcs/docker-compose.yml down

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

status : 
	@docker ps