FROM debian:bookworm

RUN apt-get update  && apt-get -y upgrade

RUN apt-get install -y nginx openssl

RUN useradd -r -d /var/lib/nginx -s /sbin/nologin -U nginx

RUN mkdir /etc/nginx/ssl
RUN chmod 700 /etc/nginx/ssl

RUN openssl genrsa -out /etc/nginx/ssl/nginx.key 2048 \
    && openssl req -x509 -key /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -days 365 -subj "/C=Mo/L=Tetouan/O=1337MED" 

COPY ./tools/nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE 443

CMD ["nginx" , "-g" , "daemon off;"]