FROM ubuntu:14.04.3
MAINTAINER Joshua Liu

RUN sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && apt-get -yq dist-upgrade
ENV HOSTNAME openmrs
RUN echo openmrs >> /etc/hosts

# Set timezone
RUN apt-get -y install tzdata

RUN apt-get -y install python-software-properties
RUN apt-get -y install software-properties-common

RUN add-apt-repository ppa:webupd8team/java
RUN add-apt-repository ppa:openhie/release
RUN apt-get update
RUN apt-get -y install openshr