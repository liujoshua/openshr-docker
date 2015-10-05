FROM ubuntu:14.04.3
MAINTAINER Joshua Liu

RUN sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && apt-get -yq dist-upgrade
ENV HOSTNAME openmrs
RUN echo openmrs >> /etc/hosts

# Set timezone
RUN apt-get -y install tzdata

sudo add-apt-repository ppa:webupd8team/java
sudo add-apt-repository ppa:openhie/release
sudo apt-get update
sudo apt-get install openshr