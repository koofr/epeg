#include <stdio.h>
#include <stdlib.h>
#include "Epeg.h"

int main(int argc, char const *argv[])
{
  char input[] = "../example.jpg";
  char output[] = "scale.jpg";
  int size = 4;
  int quality = 75;

  Epeg_Image *img;

  if (!(img = epeg_file_open(input))) {
    printf("Could not open image %s\n", input);
    exit(1);
  }

  int w;
  int h;

  epeg_size_get(img, &w, &h);

  int thumbWidth;
  int thumbHeight;

  if (w > h) {
    thumbWidth = size;
    thumbHeight = size * h / w;
  } else {
    thumbHeight = size;
    thumbWidth = size * w / h;
  }

  epeg_decode_size_set(img, thumbWidth, thumbHeight);
  epeg_quality_set(img, quality);

  epeg_file_output_set(img, output);

  if (epeg_encode(img) != 0) {
    printf("Encode failed\n");
    exit(2);
  }

  epeg_close(img);

  return 0;
}
