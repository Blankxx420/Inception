
FROM debian:oldstable

RUN apt-get update \
    && apt-get install -y nginx openssl
    
COPY /conf/server.conf /etc/nginx/site-enable/

COPY /tools/setup_nginx.sh /script/setup_nginx.sh

RUN chmod +x /script/setup_nginx.sh

EXPOSE 443 9000

CMD ["nginx","-g", "'daemon off;'"]