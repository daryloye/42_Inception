DOCKER_COMPOSE = srcs/docker-compose.yml

up:
	mkdir -p /home/daong/data/mariadb
	mkdir -p /home/daong/data/wordpress
	sudo docker-compose -f $(DOCKER_COMPOSE) up -d --build

down:
	sudo docker-compose -f $(DOCKER_COMPOSE) down -v

start:
	sudo docker-compose -f $(DOCKER_COMPOSE) start

stop:
	sudo docker-compose -f $(DOCKER_COMPOSE) stop

restart:
	sudo docker-compose -f $(DOCKER_COMPOSE) restart

build:
	sudo docker-compose -f $(DOCKER_COMPOSE) build

logs:
	sudo docker-compose -f $(DOCKER_COMPOSE) logs --tail=100

clean:
	@if [ -n "$$(sudo docker ps -aq)" ]; then sudo docker stop $$(sudo docker ps -aq); fi
	sudo docker system prune --volumes -a -f
	sudo rm -rf /home/daong/data/

re: down clean up
