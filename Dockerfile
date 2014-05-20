FROM ubuntu:quantal
MAINTAINER progrium "progrium@gmail.com"

RUN mkdir /build
ADD ./stack/ /build
run lc_all=c debian_frontend=noninteractive /build/prepare-packages
run lc_all=c debian_frontend=noninteractive /build/prepare-buildpacks
run lc_all=c debian_frontend=noninteractive /build/prepare-misc
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean
