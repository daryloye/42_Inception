DOCKER_COMPOSE = srcs/docker-compose.yml

up:
	docker-compose -f $(DOCKER_COMPOSE) up -d --build

down:
	docker-compose -f $(DOCKER_COMPOSE) down

start:
	docker-compose -f $(DOCKER_COMPOSE) start

stop:
	docker-compose -f $(DOCKER_COMPOSE) stop

restart:
	docker-compose -f $(DOCKER_COMPOSE) restart

build:
	docker-compose -f $(DOCKER_COMPOSE) build

logs:
	docker-compose -f $(DOCKER_COMPOSE) logs --tail=100
