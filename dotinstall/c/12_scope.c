#include <stdio.h>

int a = 0; // global

void f(void) {
  // int a = 0;
  a++;
  printf("a:%d\n", a);
}

int main(void) {
  f();
  printf("[main] a:%d\n", a);
  return 0;
}
