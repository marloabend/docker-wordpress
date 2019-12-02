# Docker Wordpress

Fully functional Wordpress environment with docker and docker-compose

## Local Development ##

see Makefile

## Services ##

- Database
  - mysql:8.0
  -  `localhost:3306`
    - USER: dev
    - PASSWORD: 12345678
    - ROOT_PASSWORD: root
- Wordpress
  - wordpress:5.1.1
  - php-fpm-alpine
- Webserver
  - nginx:1.15.12-alpine
  -  `localhost:80`
- PHPMyAdmin
  -  `localhost:8080`
