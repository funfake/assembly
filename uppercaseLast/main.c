#include <stdlib.h>
#include <stdio.h>
// char* uppercaseLast(char *s)
// Convert the LAST char in a sequence of letter in uppercase
// abc123xyz~,a.b" becomes abC123xyZ~,A.B
// if current is letter in alphabet AND next is null/not a character in alphabet

int main(int argc, char **argv){
    // char a[13] = {'a','b','c','1','2','3','x','y','z','~','a','.','b'};
    // char b[4] = {'a','z','A','Z'};
    char* init_d = argv[1];

    extern char* uppercaseLast(const char* init_d);

    char* c = uppercaseLast(init_d);
    printf("%s\n", c);

    return 0;
}