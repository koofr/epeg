project(example)

cmake_minimum_required(VERSION 2.8)

add_executable(rotatetest rotatetest.c)

add_executable(scaletest scaletest.c)

include_directories(${PROJECT_SOURCE_DIR}/..)
include_directories(${PROJECT_SOURCE_DIR}/../lib/libjpeg/include)

target_link_libraries(rotatetest /usr/local/lib/libjpeg.so)
target_link_libraries(rotatetest ${PROJECT_SOURCE_DIR}/../build/libepeg.so)

target_link_libraries(scaletest /usr/local/lib/libjpeg.so)
target_link_libraries(scaletest ${PROJECT_SOURCE_DIR}/../build/libepeg.so)
