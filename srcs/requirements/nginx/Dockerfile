# pull penultimate stabil debian basic image
FROM debian:bullseye

# install system wide deps for nginx
RUN apt -yqq update
RUN apt -yqq install nginx
RUN apt -yqq install openssl

COPY ./conf/default /etc/nginx/sites-available/
COPY ./tools/setup.sh /


CMD [ "/setup.sh" ]