FROM debian:12

RUN apt-get update  && apt-get -y upgrade
RUN apt-get -y install curl php-fpm php-mysql wget mariadb-server


RUN find /etc/php/ -name www.conf -exec sed -i 's|^listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|' {} \;

WORKDIR /var/www

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz && rm latest.tar.gz

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp



COPY ./requirements/wordpress/wordpress.sh .

RUN chmod +x wordpress.sh

EXPOSE 9000

RUN ./wordpress.sh

# ENTRYPOINT ["bash", "/var/www/wordpress.sh"]

# CMD ["/usr/sbin/php-fpm", "-F"]
CMD tail -f