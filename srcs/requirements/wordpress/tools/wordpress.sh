#!/bin/bash
# WP_PATH="/var/www"

# # Create or update wp-cli.yml
# cat <<EOT > "$WP_PATH/wp-cli.yml"
# path: $WP_PATH
# database:
#   dbname: $WORDPRESS_DB_NAME
#   user: $WORDPRESS_DB_USER
#   password: $WORDPRESS_DB_PASSWORD
#   host: $WORDPRESS_DB_HOST
# EOT

if [ ! -f "wordpress/wp-config.php" ]; then
	# wp core download --allow-root
	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --path=wordpress --allow-root
	wp core install --url="localhost" --title="Inception" --admin_user="$MARIADB_ADMIN_USER" \
	--admin_password="$MARIADB_ADMIN_PWD" --admin_email="admin@gmail.com" --skip-email --path=wordpress --allow-root
	wp user create $MARIADB_USER ana@gmail.com --role=author --user_pass=$MARIADB_PWD --path=wordpress --allow-root

fi
chmod -R 0777 /var/www/
chown -R www-data:www-data /var/www/

exec php-fpm8.2 -F
