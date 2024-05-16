#!/bin/bash

WP_PATH="/var/www"

# Create or update wp-cli.yml
cat <<EOT > "$WP_PATH/wp-cli.yml"
path: $WP_PATH
database:
  dbname: $WORDPRESS_DB_NAME
  user: $WORDPRESS_DB_USER
  password: $WORDPRESS_DB_PASSWORD
  host: $WORDPRESS_DB_HOST
EOT

