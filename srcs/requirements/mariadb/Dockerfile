FROM debian:bullseye

RUN apt -yqq update
RUN apt -yqq install mariadb-server

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/setup.sh /

CMD ["bash", "./setup.sh"]