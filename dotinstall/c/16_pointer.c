#include <stdio.h>

/*
ポインタ: アドレスを格納するための変数

&: アドレス演算子

*: 間接演算子
*/

int main(void) {
  int a;
  a = 10;

  int *pa;
  pa = &a;

  printf("%d\n", *pa);
  return 0;
}
