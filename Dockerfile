FROM ubuntu:12.04

RUN apt-get update \
  && apt-get install -y build-essential wget ca-certificates

RUN wget https://cmake.org/files/v3.7/cmake-3.7.2-Linux-x86_64.sh \
  && mkdir /opt/cmake \
  && sh /cmake-3.7.2-Linux-x86_64.sh --prefix=/opt/cmake --skip-license \
  && ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake

RUN wget https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/nasm-2.14.02.tar.gz \
  && tar xf nasm-2.14.02.tar.gz \
  && cd nasm-2.14.02 \
  && ./configure \
  && make install

COPY . /epeg

RUN cd /epeg \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make install
