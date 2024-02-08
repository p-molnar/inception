FROM debian:10


RUN apt -yqq update
RUN apt -yqq install php-fpm php-mysql
RUN apt -yqq install curl


COPY tools/setup.sh /
COPY conf/wp-config.php /


CMD ["./setup.sh" ]