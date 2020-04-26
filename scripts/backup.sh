#!/bin/bash

# Create backup directory
d=$(date +%Y-%m-%d-%H-%M)
mkdir ./backup/wordpress-"$d"
echo "Created directory wordpress-$d!"

# Export database
docker exec -i database mysqldump -u root -proot wordpress --skip-comments > ./backup/wordpress-"$d"/dump.sql
echo Database exported!

# Export Wordpress folder
docker cp wordpress:/var/www/html ./backup/wordpress-"$d"
echo Wordpress exported!
