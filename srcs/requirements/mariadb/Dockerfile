FROM debian:bullseye

RUN apt-get -yqq update
RUN apt-get -yqq install mariadb-server

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/setup.sh /

CMD ["./setup.sh"]