FROM ubuntu:quantal
MAINTAINER progrium "progrium@gmail.com"

RUN mkdir /build
ADD ./stack/ /build
RUN sed -i 's/archive.ubuntu.com/au.archive.ubuntu.com\/pub/g' /etc/apt/sources.list
RUN lc_all=c debian_frontend=noninteractive /build/prepare-packages
RUN lc_all=c debian_frontend=noninteractive /build/prepare-buildpacks
RUN lc_all=c debian_frontend=noninteractive /build/prepare-custom-buildpacks
RUN lc_all=c debian_frontend=noninteractive /build/prepare-misc
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean
