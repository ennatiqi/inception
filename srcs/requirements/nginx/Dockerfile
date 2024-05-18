FROM debian:12.2

RUN apt-get update  && apt-get -y upgrade

RUN apt-get install -y nginx openssl

RUN useradd -r -d /var/lib/nginx -s /sbin/nologin -U nginx



# COPY ./app/index.html /home/rennatiq/project/srcs/requirements/nginx/app/index.html


RUN mkdir /etc/nginx/ssl
RUN chmod 700 /etc/nginx/ssl

RUN openssl genrsa -out /etc/nginx/ssl/nginx.key 2048 \
    && openssl req -x509 -key /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -days 365 -subj "/C=Mo/L=Tetouan/O=1337MED/UID=123456+CN=nginx" 


COPY ./requirements/nginx/tools/nginx.conf /etc/nginx/conf.d/nginx.conf
# conf.d
#/etc/nginx/nginx.conf
EXPOSE 443

CMD ["nginx" , "-g" , "daemon off;"]