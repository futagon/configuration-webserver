# configuration-webserver
#
# VERSION 1.0

FROM futagon/bootstrapping

MAINTAINER toyama satoshi <toyamarinyon@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# add nginx repository
RUN apt-get install -y python-software-properties
RUN apt-get update
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update

# install dependency
RUN apt-get -y install nginx

# copy nginx configuration file
ADD conf/nginx.conf /etc/nginx/nginx.conf
Add conf/default.conf /etc/nginx/conf.d/default.conf

# copy nginx public directory
ADD public /var/www

# EXPOSE http port
EXPOSE 80

# exec cmd on container running
CMD  ["service","nginx","start"]
