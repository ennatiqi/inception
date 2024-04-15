FROM debian:latest

RUN apt-get update

RUN apt-get install -y php8.2 php8.2-fpm php8.2-mysql wget apache2 mariadb-server


RUN find /etc/php/ -name www.conf -exec sed -i 's|^listen = 127.0.0.1:9000|listen = 9000|' {} \;



RUN cd /var/www/html && wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf /var/www/html/latest.tar.gz && rm /var/www/html/latest.tar.gz

RUN chown -R www-data:www-data wordpress/

RUN cd wordpress/

# RUN mv wp-config-sample.php wp-config.php


RUN find . -type d -exec chmod 755 {} \;

RUN find . -type f -exec chmod 644 {} \;



EXPOSE 9000

CMD ["/usr/sbin/php-fpm8", "-F"]
