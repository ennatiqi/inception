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

if [ ! -f "wp-config.php" ]; then
	wp core download
	wp config create --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=mariadb:3306 --allow-root
	wp core install --url="localhost" --title="Inception" --admin_user="$MARIADB_USER" \
	--admin_password="$MARIADB_PASSWORD" --admin_email="sidqi.ayman.96@gmail.com" --skip-email
	wp user create $MARIADB_ADMIN_USER ana@gmail.com --role=author --user_pass=$MARIADB_ADMIN_PWD --allow-root

fi
  chmod -R 0777 /var/www/
  chown -R www-data:www-data /var/www/