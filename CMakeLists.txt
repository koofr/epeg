project(epeg)

cmake_minimum_required(VERSION 2.8)

add_library(epeg SHARED epeg_main.c)

set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/dist)
file(MAKE_DIRECTORY ${CMAKE_INSTALL_PREFIX})

IF(APPLE)
  set(LIBJPEG_LIBRARY ${CMAKE_INSTALL_PREFIX}/lib/libjpeg.dylib)
ELSE()
  set(LIBJPEG_LIBRARY ${CMAKE_INSTALL_PREFIX}/lib/libjpeg.so)
ENDIF(APPLE)

include_directories(${CMAKE_INSTALL_PREFIX}/include)
target_link_libraries(epeg ${LIBJPEG_LIBRARY})

include(ExternalProject)
ExternalProject_Add(libjpeg
    SOURCE_DIR ${PROJECT_SOURCE_DIR}/vendor/libjpeg-turbo-2.0.4
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX})

add_dependencies(epeg libjpeg)

install(TARGETS epeg
    LIBRARY DESTINATION lib COMPONENT libraries)

INSTALL(FILES Epeg.h
    DESTINATION include)
