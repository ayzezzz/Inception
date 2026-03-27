NAME = inception
DATA_PATH =/home/zayaz/data
COMPOSE_FILE = srcs/docker-compose.yml
COMPOSE = docker compose -f $(COMPOSE_FILE)

all: setup build up

setup:
	@mkdir -p $(DATA_PATH)/wordpress
	@mkdir -p $(DATA_PATH)/mariadb
	-@chmod 777 $(DATA_PATH)/wordpress
	-@chmod 777 $(DATA_PATH)/mariadb

build:
	$(COMPOSE) build

up:
	$(COMPOSE) up -d

stop:
	$(COMPOSE) stop

down:
	$(COMPOSE) down

clean: down
	docker system prune -af

fclean: down
	docker system prune -a --volumes -f
	sudo rm -rf $(DATA_PATH)

re: fclean all

.PHONY: all setup build up stop down clean fclean re