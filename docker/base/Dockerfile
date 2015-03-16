FROM ubuntu:14.04

RUN echo "$(cat /etc/apt/sources.list) universe multiverse" > /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get -y install curl wget vim-tiny nano