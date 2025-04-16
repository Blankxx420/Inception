FROM debian:bullseye

RUN apt-get update -y && apt-get install wget php php-fpm -y

RUN mkdir -p var/www/html/adminer

RUN mkdir -p run/php/

RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 8080/g' /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://www.adminer.org/latest.php -O /var/www/html/adminer/index.php

EXPOSE 8080

CMD ["/usr/sbin/php-fpm7.4", "-F"]