FROM debian:oldstable

RUN apt-get update \
    && apt-get install -y mariadb-server
    
COPY /conf/mariadb.conf /etc/mysql/conf.d/

COPY /tools/create_database.sh /script/create_database.sh

RUN chmod +x /script/create_database.sh

EXPOSE 3306

CMD ["/script/create_database.sh"]