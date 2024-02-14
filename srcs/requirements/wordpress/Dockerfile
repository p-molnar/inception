FROM debian:10


RUN apt -yqq update
RUN apt -yqq install php-fpm php-mysql
RUN apt -yqq install curl


COPY conf/wp-config.php /
COPY tools/setup.sh /


CMD ["./setup.sh"]