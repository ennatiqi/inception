#!/bin/bash

if [ ! -f "wordpress/wp-config.php" ]; then
	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --path=wordpress  --allow-root
	wp core install --url="$DOMAIN_NAME" --title="Inception" --admin_user="$MYSQL_USER" \
	--admin_password="$MYSQL_PASSWORD" --admin_email="$MARIADB_ADMIN_EMAIL" --skip-email --path=wordpress --allow-root
	wp user create $MARIADB_USER $MARIADB_EMAIL --role=author --user_pass=$MARIADB_PWD --path=wordpress --allow-root

fi
chmod -R 777 /var/www/

exec php-fpm8.2 -F
