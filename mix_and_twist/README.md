# Mix Assembly and C

> ### Why ?
> Provides extra flexibility.

## Sources
- [How to Mix C and Assembly](https://www.devdungeon.com/content/how-mix-c-and-assembly)
- [Compile error: relocation R_X86_64_PC32](https://stackoverflow.com/questions/36007975/compile-error-relocation-r-x86-64-pc32-against-undefined-symbol)

## Steps
1. Create the assembly file/library *(say_hi.asm)*
    - as usual except there is no `_start` but `function_name`
    - add `ret` statement (to return to the C program)
    - compile to object file `nasm say_hi.asm -f elf64`
2. Create the C file *(example.c)*
    - normal C program
    - declare the external assembly function `extern function_name();`
    - invoke function `function_name();`
    - compile and link to executable `gcc example.c say_hi.o -o hello -no-pie`
3. Assembly file using C functions *(printf.asm)*
    - declare the external function `extern c_function`
    - use `main` instead of `_start`
    - save stack using `push` then `pop`
    - call the function using `call    printf WRT ..plt` (WRT = "With Respect To ...", i.e, "in the context of ...")
    - use `ret` to return (with code 0 in rax)
    - compile using nasm `nasm -f elf64 -o printf.o printf.asm`
    - link using gcc to access c librairies `gcc printf.o`