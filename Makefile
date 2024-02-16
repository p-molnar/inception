all : up

up :
	mkdir -p data/mysql
	mkdir -p data/wordpress
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

fclean : stop rm_images rm_volumes rm_networks rm_containers
	rm -rf data

re: clean up

status : 
	docker ps