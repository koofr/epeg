project(example)

cmake_minimum_required(VERSION 2.8)

add_executable(rotatetest rotatetest.c)

add_executable(scaletest scaletest.c)

include_directories(${PROJECT_SOURCE_DIR}/..)
include_directories(${PROJECT_SOURCE_DIR}/../lib/libjpeg/include)

IF(APPLE)
  set(LIBJPEG_LIBRARY /usr/local/lib/libjpeg.dylib)
  set(LIBEPEG_LIBRARY ${PROJECT_SOURCE_DIR}/../build/libepeg.dylib)
ELSE()
  set(LIBJPEG_LIBRARY /usr/local/lib/libjpeg.so)
  set(LIBEPEG_LIBRARY ${PROJECT_SOURCE_DIR}/../build/libepeg.so)
ENDIF(APPLE)

target_link_libraries(rotatetest ${LIBJPEG_LIBRARY})
target_link_libraries(rotatetest ${LIBEPEG_LIBRARY})

target_link_libraries(scaletest ${LIBJPEG_LIBRARY})
target_link_libraries(scaletest ${LIBEPEG_LIBRARY})
