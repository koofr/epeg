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

include(ExternalProject)
ExternalProject_Add(libjpeg
    SOURCE_DIR ${PROJECT_SOURCE_DIR}/vendor/libjpeg-turbo-2.0.4
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DCMAKE_POSITION_INDEPENDENT_CODE=True)

add_dependencies(epeg libjpeg)

install(TARGETS epeg
    ARCHIVE DESTINATION lib
    COMPONENT libraries)

INSTALL(FILES Epeg.h
    DESTINATION include)
