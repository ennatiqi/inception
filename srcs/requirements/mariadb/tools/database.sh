#!/bin/bash


cat << EOF > /tmp/maria.sql
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '@{MYSQL_ROOT_PASSWORD}';
EOF

mariadbd --user=root --bootstrap < /tmp/maria.sql



mariadbd --user=root
# mysql -u root -p"$MYSQL_ROOT_PASSWORD" << EOF
# FLUSH PRIVILEGES;
# CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
# CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
# GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'localhost';
# FLUSH PRIVILEGES;
# EOF
