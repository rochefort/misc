#include <stdio.h>

void f(long *pa) {
  *pa += 100;
  printf("%ld\n", *pa);
}

int main(void) {
  long a = 1000;
  f(&a);
  return 0;
}
