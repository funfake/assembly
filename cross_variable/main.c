#include <stdio.h>
#include <stdlib.h>
#define MAXSTR 10

const char _global_var[5] = {'t','e','s','t','\n'};
const int _global_var_length = sizeof(_global_var);

extern void _bar();

/* int foo(){
  return bar();
} */

int main(){
  _bar();
  return 0;
}