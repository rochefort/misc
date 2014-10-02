#include <stdio.h>

int main(void) {
  int m = 0;
  while (m < 10) {
    printf("m: %d\n", m);
    m ++;
  }

  int n = 0;
  do {
    printf("n: %d\n", n);
    n++;
  } while (n < 10);
  return 0;
}
