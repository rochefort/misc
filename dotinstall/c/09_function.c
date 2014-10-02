#include <stdio.h>

/*
関数：　複数の処理

返り値の方　関数名（引数、 ...） {
  処理;
  return 返り値;
}
*/

float getMax(float a, float b) {
  if(a >= b) {
    return a;
  } else {
    return b;
  }
}

int main(void) {
  float result;
  result = getMax(2.3, 5.2);
  printf("%f\n", result);
  return 0;
}
