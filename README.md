epeg
====

Insanely fast JPEG/JPG thumbnail scaling with the minimum fuss and CPU
overhead. It makes use of libjpeg features of being able to load an image by
only decoding the DCT coefficients needed to reconstruct an image of the size
desired.

Forked from https://github.com/mattes/epeg

Bundles `libjpeg-turbo` `2.1.91`.

## Dependencies

For Linux see `Dockerfile`.

macOS:

```sh
brew install cmake nasm
```

## Build

```sh
git clone https://github.com/koofr/epeg.git
cd epeg

mkdir build
cd build
cmake -DCMAKE_OSX_DEPLOYMENT_TARGET=10.14.6 ..
# this will create a ./dist folder
make install
```

## Build in Docker

```sh
docker build -t epeg .
docker create --name epeg-copy epeg
mkdir out
cd out
docker cp epeg-copy:/epeg/dist/lib/libepeg.a libepeg_linux_amd64.a
docker cp epeg-copy:/epeg/dist/lib/libjpeg.a libjpeg_linux_amd64.a
docker cp epeg-copy:/epeg/dist/include/Epeg.h Epeg.h
docker rm epeg-copy
```

## Run the example project

```sh
# make sure to build the project first
cd example
mkdir build
cd build
cmake ..
make
./rotatetest
./scaletest
```
