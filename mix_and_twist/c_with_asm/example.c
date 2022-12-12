/* example.c */
/* Compile and link command: gcc example.c say_hi.o -o hello -no-pie */ 
#include <stdio.h>

int main(int argc, char *argv[]) {
	extern say_hi(); // we call say_hi() from an external location
	say_hi();
    return 0;
}