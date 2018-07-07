project(epeg)

cmake_minimum_required(VERSION 2.8)

set(CMAKE_MACOSX_RPATH 1)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

add_library(epeg STATIC epeg_main.c)

set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/dist)
file(MAKE_DIRECTORY ${CMAKE_INSTALL_PREFIX})

set(LIBJPEG_LIBRARY ${CMAKE_INSTALL_PREFIX}/lib/libjpeg.a)

include_directories(${CMAKE_INSTALL_PREFIX}/include)
target_link_libraries(epeg ${LIBJPEG_LIBRARY})

IF(APPLE)
  set(LIBJPEG_CONFIGURE --host x86_64-apple-darwin NASM=/usr/local/bin/nasm)
ELSE()
  set(LIBJPEG_CONFIGURE --with-pic)
ENDIF(APPLE)

include(ExternalProject)
ExternalProject_Add(libjpeg
    SOURCE_DIR ${PROJECT_SOURCE_DIR}/vendor/libjpeg-turbo-1.3.1
    CONFIGURE_COMMAND CFLAGS=-fPIC ${PROJECT_SOURCE_DIR}/vendor/libjpeg-turbo-1.3.1/configure --prefix=${CMAKE_INSTALL_PREFIX} ${LIBJPEG_CONFIGURE}
    BUILD_COMMAND ${MAKE})

add_dependencies(epeg libjpeg)

install(TARGETS epeg
    ARCHIVE DESTINATION lib
    COMPONENT libraries)

INSTALL(FILES Epeg.h
    DESTINATION include)
