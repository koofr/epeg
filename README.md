epeg
====

Insanely fast JPEG/JPG thumbnail scaling with the minimum fuss and CPU
overhead. It makes use of libjpeg features of being able to load an image by
only decoding the DCT coefficients needed to reconstruct an image of the size
desired.

Forked from https://github.com/mattes/epeg

## Dependencies

For Linux see `Dockerfile`.

macOS:

```sh
brew install cmake nasm
```

## Install

```sh
git clone https://github.com/koofr/epeg.git
cd epeg
mkdir build
cd build
cmake ..
sudo make install
```

## Build in Docker

```sh
docker build -t epeg .
docker run -d --name epeg-copy epeg sh -c 'sleep 9999999'
mkdir out
cd out
docker cp epeg-copy:/epeg/dist/lib/libepeg.a libepeg_linux_amd64.a
docker cp epeg-copy:/epeg/dist/lib/libjpeg.a libjpeg_linux_amd64.a
docker cp epeg-copy:/epeg/dist/include/Epeg.h Epeg.h
```
