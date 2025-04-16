FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y mariadb-server mariadb-client

# Create necessary directories
RUN mkdir -p /run/mysqld \
    && chown -R mysql:mysql /run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql

COPY /conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY /tools/create_database.sh /script/create_database.sh

RUN chmod +x /script/create_database.sh

EXPOSE 3306

CMD ["bash", "/script/create_database.sh"]