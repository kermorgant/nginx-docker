FROM nginx:stable
MAINTAINER Mikael Kermorgant <mikael@kgtech.fi>
ENV REFRESHED_AT 2016-12-05

RUN apt-get update && apt-get install -y \
    geoip-database \
    libgeoip1 \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html

ADD https://raw.githubusercontent.com/kermorgant/docker-tools/master/bin/wait-for-it.sh /usr/local/bin/wait-for-it.sh

RUN chmod +x /usr/local/bin/wait-for-it.sh

CMD ["nginx", "-g", "daemon off;"]
