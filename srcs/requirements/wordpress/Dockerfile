FROM debian:bookworm

RUN apt-get update  && apt-get -y upgrade
RUN apt-get -y install curl php-fpm php-mysql wget


RUN  sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/8.2/fpm/pool.d/www.conf

WORKDIR /var/www

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz && rm latest.tar.gz

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp



COPY ./requirements/wordpress/tools/wordpress.sh .

RUN chmod +x wordpress.sh

EXPOSE 9000

CMD [ "./wordpress.sh" ]
