name = inception

all:
	@/home/rennatiq/project/srcs/requirements/tools/mkdir.sh
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@/home/rennatiq/project/srcs/requirements/tools/mkdir.sh
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@/home/rennatiq/project/srcs/requirements/tools/mkdir.sh
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re: down
	@/home/rennatiq/project/srcs/requirements/tools/mkdir.sh
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	@docker system prune -a
	@sudo rm -rf ~/data/wordpress
	@sudo rm -rf ~/data/mariadb

fclean: down
	@docker stop $(docker ps -q) || true
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/wordpress
	@sudo rm -rf ~/data/mariadb

.PHONY	: all build down re clean fclean