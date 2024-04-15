FROM debian:latest

RUN apt-get update

RUN apt-get install -y nginx

RUN useradd -r -d /var/lib/nginx -s /sbin/nologin -U nginx

COPY ./app/index.html /home/rennatiq/project/srcs/requirements/nginx/app/index.html

COPY nginx.conf /etc/nginx/nginx.conf

COPY ./tools/ssl/nginx.crt /etc/nginx/tools/ssl/nginx.crt
COPY ./tools/ssl/nginx.key /etc/nginx/tools/ssl/nginx.key

EXPOSE 8080

CMD ["nginx" , "-g" , "daemon off;"]