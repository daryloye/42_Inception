DOCKER_COMPOSE = srcs/docker-compose.yml

up:
	sudo docker-compose -f $(DOCKER_COMPOSE) up -d --build

down:
	sudo docker-compose -f $(DOCKER_COMPOSE) down

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
	sudo docker system prune -a -f
