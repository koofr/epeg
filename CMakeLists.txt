project(epeg)

cmake_minimum_required(VERSION 2.8)

add_library(epeg SHARED epeg_main.c)

include_directories(${PROJECT_SOURCE_DIR}/lib/libjpeg/include)
target_link_libraries(epeg ${PROJECT_SOURCE_DIR}/lib/libjpeg/lib/libjpeg.so)

include(ExternalProject)
ExternalProject_Add(libjpeg
    SOURCE_DIR ${PROJECT_SOURCE_DIR}/vendor/libjpeg-turbo-1.3.1
    CONFIGURE_COMMAND ${PROJECT_SOURCE_DIR}/vendor/libjpeg-turbo-1.3.1/configure --prefix=${PROJECT_SOURCE_DIR}/lib/libjpeg
    BUILD_COMMAND ${MAKE})

add_dependencies(epeg libjpeg)
