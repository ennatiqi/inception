#!/bin/bash

if [ ! -f "wordpress/wp-config.php" ]; then
	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --path=wordpress  --allow-root
	wp core install --url="$DOMAIN_NAME" --title="Inception" --admin_user="$MARIADB_ADMIN_USER" \
	--admin_password="$MARIADB_ADMIN_PWD" --admin_email="$MARIADB_ADMIN_email" --skip-email --path=wordpress --allow-root
	wp user create $MARIADB_USER $MARIADB_email --role=author --user_pass=$MARIADB_PWD --path=wordpress --allow-root

fi
chmod -R 0777 /var/www/
chown -R www-data:www-data /var/www/

exec php-fpm8.2 -F
