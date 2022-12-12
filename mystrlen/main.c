#include <stdlib.h>
#include <stdio.h>

int main(int argc, char const *argv[]){
    char a[5] = {'t','e','s','t','e'};
    int b = 9;

    extern unsigned int mystrlen(const char* a);

    int c = mystrlen(a);
    printf("%d", c);

    return 0;
}