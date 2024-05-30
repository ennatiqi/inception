all:
	@/home/rennatiq/project/srcs/requirements/tools/mkdir.sh
	@docker compose -f ./srcs/docker-compose.yml up -d  --build

down :
	@docker compose -f ./srcs/docker-compose.yml down


clean: down
	@sudo rm -rf ~/data/wordpress
	@sudo rm -rf ~/data/mariadb

re: down all

fclean: clean
	@docker system prune -af

.PHONY	: all re clean fclean