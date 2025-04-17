FROM debian:bullseye

RUN apt-get update -y && apt-get install wget php php-fpm php-mysqli -y

RUN mkdir -p /usr/share/adminer

RUN chown -R www-data:www-data /usr/share/adminer
RUN find /usr/share/adminer -type d -exec chmod 755 {} \;
RUN find /usr/share/adminer -type f -exec chmod 644 {} \;
RUN mkdir -p run/php/

RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 8080/g' /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://www.adminer.org/latest.php -O /usr/share/adminer/adminer.php

EXPOSE 8080

CMD ["/usr/sbin/php-fpm7.4", "-F"]