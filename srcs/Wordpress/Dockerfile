FROM debian:bullseye

RUN apt-get update -y \
	&& apt-get install -y curl php-fpm php-mysqli mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN wp cli --allow-root update

COPY /tools/wordpress_setup.sh /script/wordpress_setup.sh

RUN chmod +x /script/wordpress_setup.sh

CMD [ "./script/wordpress_setup.sh" ]