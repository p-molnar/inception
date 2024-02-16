all : up

up :
	rm -rf /Users/pmolnar/data/
	mkdir -p /Users/pmolnar/data/mysql
	mkdir -p /Users/pmolnar/data/wordpress
	docker-compose -f srcs/docker-compose.yml up

down : stop
	docker-compose -f srcs/docker-compose.yml down

start : 
	docker-compose -f srcs/docker-compose.yml start

stop : 
	docker-compose -f srcs/docker-compose.yml stop

stop_all :
	docker network rm $(docker network ls -q) 

rm_images :
	docker rmi $(docker images -qa);

rm_volumes :
	docker volume rm $(docker volume ls -q);

rm_networks	:
	docker network rm $(docker network ls -q) 2&> /dev/null;

rm_containers :
	docker rm $(docker ps -qa);

fclean : stop
	rm -rf /Users/pmolnar/data/
	docker container rm -f nginx
	docker container rm -f wordpress
	docker container rm -f mariadb
	docker rmi -f pmolnar/wordpress
	docker rmi -f pmolnar/nginx
	docker rmi -f pmolnar/mariadb
	docker volume rm mariadb
	docker volume rm wordpress
	docker network rm inception

re: up

status : 
	docker ps