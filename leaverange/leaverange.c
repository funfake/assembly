#include <stdio.h>

int main(int argc, char* argv[]) {

    extern char* leaverng(char* s, char a, char b);

    if (argc > 3) {
        printf("before: %s\n", argv[1]);
        printf("after: %s\n", leaverng(argv[1], argv[2][0], argv[3][0]));
    }
}