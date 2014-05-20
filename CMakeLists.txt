project(epeg)

cmake_minimum_required(VERSION 2.8)

add_library(epeg SHARED epeg_main.c)

include_directories(/usr/local/include)
target_link_libraries(epeg /usr/local/lib/libjpeg.so)

include(ExternalProject)
ExternalProject_Add(libjpeg
    SOURCE_DIR ${PROJECT_SOURCE_DIR}/vendor/libjpeg-turbo-1.3.1
    CONFIGURE_COMMAND ${PROJECT_SOURCE_DIR}/vendor/libjpeg-turbo-1.3.1/configure --prefix=${CMAKE_INSTALL_PREFIX}
    BUILD_COMMAND ${MAKE})

add_dependencies(epeg libjpeg)

install(TARGETS epeg
    LIBRARY DESTINATION lib COMPONENT libraries)

INSTALL(FILES Epeg.h
    DESTINATION include)
