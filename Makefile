.PHONY: dev detached down clean database-export database-import wordpress-export wordpress-import shell-database shell-webserver shell-wordpress

dev:
	@docker-compose up

detached:
	@docker-compose up -d

down:
	@docker-compose down

database-import: detached
	docker exec -i database mysql -u root -proot wordpress < database/import/dump.sql
	@-echo Database imported from ./database/import/dump.sql !

wordpress-import: detached
	 @docker cp ./wordpress/import/html wordpress:/var/www/
	 @-echo Wordpress imported !

backup: detached
	 @sh ./scripts/backup.sh

shell-database:
	 docker exec -it database sh

shell-webserver:
	 docker exec -it webserver sh

shell-wordpress:
	 docker exec -it wordpress bash
