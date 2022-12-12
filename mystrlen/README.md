# MYSTRLEN function
Main C program taking advantage of an Assembly subroutine

## Ressources
- [How to compile 32-bit program on 64-bit gcc in C and C++](geeksforgeeks.org/compile-32-bit-program-64-bit-gcc-c-c/)
- [Assembly - System Calls](https://www.tutorialspoint.com/assembly_programming/assembly_system_calls.htm)
- [How do you use gcc to generate assembly code in Intel syntax?](https://stackoverflow.com/questions/199966/how-do-you-use-gcc-to-generate-assembly-code-in-intel-syntax)

## How to run
- Compile assembly code in 32 bit (does not work in 64 bit) `nasm mystrlen.asm -f elf32`
- Compile and link C and Object files in 32 bit mode `gcc main.c mystrlen.o -o mystrlen -no-pie -m32`
    - requires `sudo apt install gcc-multilib` to be installed before hand
- Run `./mystrlen`