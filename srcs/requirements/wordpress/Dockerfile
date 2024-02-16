FROM debian:11


RUN apt -yqq update
RUN apt -yqq upgrade
RUN apt -yqq install php php-fpm php-mysql
RUN apt -yqq install curl


COPY conf/wp-config.php /
COPY tools/setup.sh /


CMD ["./setup.sh"]