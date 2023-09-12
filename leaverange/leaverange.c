#include <stdio.h>

int main(int argc, char** argv) {

    extern char* rng(const char* s, const char a, const char b);

    char* s = argv[1];
    char first = argv[2][0];
    char last = argv[3][0];

    char* c = rng(s, first, last);

    if (argc > 3) {
        printf("before: %s, btw %c and %c\n", s, first, last);
        printf("after: %s\n", c);
    }
    return 0;
}