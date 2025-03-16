
FROM debian:bullseye

RUN apt-get update && apt-get install nginx -y

RUN apt-get install openssl vim curl -y

RUN openssl genpkey -algorithm RSA -out /etc/ssl/private/brguicho.42.fr.key

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \ 
-keyout /etc/ssl/private/brguicho.42.fr.key \
-out /etc/ssl/certs/brguicho.42.fr.crt \ 
-subj="/C=FR/ST=foo/L=Foo/O=adaad/OU=AD/CN=foo/emailAdrress=13@gmail.com"

COPY ./conf/server.conf /etc/nginx/sites-available/default

EXPOSE 443 9000

CMD ["nginx", "-g", "daemon off;"]