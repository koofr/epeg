FROM ubuntu:16.04

RUN apt-get update \
  && apt-get install -y build-essential wget ca-certificates

RUN wget https://github.com/Kitware/CMake/releases/download/v3.26.0/cmake-3.26.0-linux-x86_64.sh \
  && mkdir /opt/cmake \
  && sh /cmake-3.26.0-linux-x86_64.sh --prefix=/opt/cmake --skip-license \
  && ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake

RUN wget https://www.nasm.us/pub/nasm/releasebuilds/2.16.01/nasm-2.16.01.tar.gz \
  && tar xf nasm-2.16.01.tar.gz \
  && cd nasm-2.16.01 \
  && ./configure \
  && make install

COPY . /epeg

RUN cd /epeg \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make install
