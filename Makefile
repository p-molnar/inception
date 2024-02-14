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

rm_images :
	docker image rm -f pmolnar/nginx
	docker image rm -f pmolnar/mariadb
	docker image rm -f pmolnar/wordpress

clean: down rm_images
	rm -rf data

re: clean up

status : 
	docker ps