#include <stdio.h>

/*
文字列： charの配列（終端は「\0」）

char s[] = {'a', 'b', 'c', '\0'};
char s[] = "abc";

終端があるので、添字を書く場合は+1する必要がある
char s[4] = "abc"
*/

int main(void) {
  char s[] = "abc";
  printf("%c\n", s[1]);
  return 0;
}
