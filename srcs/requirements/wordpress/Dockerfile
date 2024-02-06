FROM debian:bullseye


RUN apt -yqq update
RUN apt -yqq install php-fpm php-mysql
RUN apt -yqq install curl


COPY ./tools/setup.sh /
COPY ./tools/wp-config.php /


CMD [ "bash", "./setup.sh" ]