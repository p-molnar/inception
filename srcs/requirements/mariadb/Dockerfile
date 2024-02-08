FROM debian:10

RUN apt -yqq update
RUN apt -yqq upgrade
RUN apt -yqq install mariadb-server

COPY "./conf/50-server.cnf" "/etc/mysql/mariadb.conf.d/"
COPY "tools/setup.sh" "."

CMD ["./setup.sh"]