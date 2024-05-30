FROM debian:bookworm

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld && chmod 777 /var/run/mysqld

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf 

COPY ./tools/database.sh .

RUN chmod +x database.sh

EXPOSE 3306

CMD ["./database.sh"]