project(example)

cmake_minimum_required(VERSION 2.8)

add_executable(rotatetest rotatetest.c)

add_executable(scaletest scaletest.c)

set(EPEG_DIST ${PROJECT_SOURCE_DIR}/../dist)

include_directories(${EPEG_DIST}/include)

IF(APPLE)
  set(LIBJPEG_LIBRARY ${EPEG_DIST}/lib/libjpeg.dylib)
  set(LIBEPEG_LIBRARY ${EPEG_DIST}/lib/libepeg.dylib)
ELSE()
  set(LIBJPEG_LIBRARY ${EPEG_DIST}/lib/libjpeg.so)
  set(LIBEPEG_LIBRARY ${EPEG_DIST}/lib/libepeg.so)
ENDIF(APPLE)

target_link_libraries(rotatetest ${LIBJPEG_LIBRARY})
target_link_libraries(rotatetest ${LIBEPEG_LIBRARY})

target_link_libraries(scaletest ${LIBJPEG_LIBRARY})
target_link_libraries(scaletest ${LIBEPEG_LIBRARY})
