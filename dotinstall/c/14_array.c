#include <stdio.h>

int main(void) {
  int sales[3];
  sales[0] = 200;
  sales[1] = 400;
  sales[2] = 300;

  // 初期値代入時は添字不要
  // int sales2[] = {200, 400, 300};
  int sales2[3] = {200, 400, 300};

  printf("%d\n", sales[1]);
  printf("%d\n", sales2[1]);
  return 0;
}
