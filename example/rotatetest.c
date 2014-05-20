#include <stdio.h>
#include <stdlib.h>
#include "Epeg.h"

int main(int argc, char const *argv[])
{
  char input[] = "../example.jpg";
  char output[] = "transform.jpg";

  Epeg_Image *img;

  if (!(img = epeg_file_open(input))) {
    printf("Could not open image %s\n", input);
    exit(1);
  }

  epeg_transform_set(img, EPEG_TRANSFORM_ROT_270);

  epeg_file_output_set(img, output);

  if (epeg_transform(img) != 0) {
    printf("Transform failed\n");
    exit(2);
  }

  epeg_close(img);

  return 0;
}
