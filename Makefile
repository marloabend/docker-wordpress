.PHONY: dev detached down clean database-export database-import wordpress-export wordpress-import shell-database shell-webserver shell-wordpress

dev:
	@docker-compose up

detached:
	@docker-compose up -d

down:
	@docker-compose down

database-export: detached
	docker exec -i database mysqldump -u root -proot wordpress --skip-comments > database/dump.sql
	@-echo Database exported to ./database/dump.sql !

database-import: detached
	docker exec -i database mysql -u root -proot wordpress < database/import/dump.sql
	@-echo Database imported from ./database/import/dump.sql !

wordpress-export: detached
	 @docker cp wordpress:/var/www/html ./wordpress
	 @-echo Wordpress exported to ./wordpress/html !

wordpress-import: detached
	 @docker cp ./wordpress/import/html wordpress:/var/www/
	 @-echo Wordpress imported !

shell-database:
	 docker exec -it database sh

shell-webserver:
	 docker exec -it webserver sh

shell-wordpress:
	 docker exec -it wordpress bash
