FROM debian:bullseye

RUN apt-get update -y \
	&& apt-get install -y curl php-fpm

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN wp cli update -y

COPY /tools/wordpress_setup.sh /script/wordpress_setup.sh

RUN chmod +x /script/wordpress_setup.sh

EXPOSE 3306 9000

CMD [ "./script/wordpress_setup.sh" ]