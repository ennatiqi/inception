FROM debian:12

RUN apt-get update  && apt-get -y upgrade

RUN apt-get install -y nginx openssl

RUN useradd -r -d /var/lib/nginx -s /sbin/nologin -U nginx



# COPY ./tools/nginx.conf /etc/nginx/nginx.conf


# COPY ./app/index.html /home/rennatiq/project/srcs/requirements/nginx/app/index.html

# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx-selfsigned.key -out nginx-selfsigned.crt


# COPY nginx-selfsigned.crt /etc/nginx/ssl/nginx-selfsigned.crt
# COPY nginx-selfsigned.key /etc/nginx/ssl/nginx-selfsigned.key

# COPY /etc/ssl/certs/nginx-selfsigned.crt ./tools
# COPY /etc/ssl/private/nginx-selfsigned.key ./tools

EXPOSE 8080

CMD ["nginx" , "-g" , "daemon off;"]