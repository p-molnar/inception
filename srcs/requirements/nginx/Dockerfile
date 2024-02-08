FROM debian:10

# Install Nginx
RUN apt-get -yqq update
RUN apt-get -yqq install nginx
RUN apt-get -yqq install openssl

# copy relevant docs from host machine to container
COPY "tools/setup.sh" "/"

# Start Nginx
CMD ["./setup.sh"]
