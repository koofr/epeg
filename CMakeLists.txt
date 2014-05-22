project(epeg)

cmake_minimum_required(VERSION 2.8)

add_library(epeg SHARED epeg_main.c)

IF(APPLE)
  set(LIBJPEG_LIBRARY /usr/local/lib/libjpeg.dylib)
ELSE()
  set(LIBJPEG_LIBRARY /usr/local/lib/libjpeg.so)
ENDIF(APPLE)

include_directories(/usr/local/include)
target_link_libraries(epeg ${LIBJPEG_LIBRARY})

IF(APPLE)
  set(LIBJPEG_CONFIGURE --host x86_64-apple-darwin NASM=/usr/local/bin/nasm)
ENDIF(APPLE)

include(ExternalProject)
ExternalProject_Add(libjpeg
    SOURCE_DIR ${PROJECT_SOURCE_DIR}/vendor/libjpeg-turbo-1.3.1
    CONFIGURE_COMMAND ${PROJECT_SOURCE_DIR}/vendor/libjpeg-turbo-1.3.1/configure --prefix=${CMAKE_INSTALL_PREFIX} ${LIBJPEG_CONFIGURE}
    BUILD_COMMAND ${MAKE})

add_dependencies(epeg libjpeg)

install(TARGETS epeg
    LIBRARY DESTINATION lib COMPONENT libraries)

INSTALL(FILES Epeg.h
    DESTINATION include)
