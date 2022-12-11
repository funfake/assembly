# ASM x86

## Resources
- [Video: HelloWorld in x86 assembly by John Hammond](https://www.youtube.com/watch?v=HgEGAaYdABA)
- [Video: Assembly Language in 100 Seconds](https://www.youtube.com/watch?v=4gwYkEK0gOk)
- [Registers in x86(64) assembly](https://www.cs.uaf.edu/2017/fall/cs301/lecture/09_11_registers.html#:~:text=rax%20is%20the%2064%2Dbit,processors%20with%20the%2080386%20CPU.)
- [Assembly: System Calls](https://www.tutorialspoint.com/assembly_programming/assembly_system_calls.htm#:~:text=System%20calls%20are%20APIs%20for,exiting%20from%20the%20program%2C%20respectively.)
- [Introduction to 8086
Assembly](https://wp.kntu.ac.ir/nasihatkon/teaching/asm/s2018/Assembly%20-%20Lecture%203.pdf)
- [Assembly code in macOS for Intel x86_64](https://rderik.com/blog/let-s-write-some-assembly-code-in-macos-for-intel-x86-64/)

## Program layout
Divided into 3 sections
- text section : contains the logic of the program
- block starting section (.bss) : contains variables
- data : contains constants or data that does not change

## Comments
Semi colon `;` to comment.
We usually give some infos about the program on top of the document. 
```
; hello_world.asm
;
; Author: William BRISA
; Date 11-Dec-2022
```

## Sections
We prefix sections with `.` and name them with `section_name` then suffix them with `:` as in Python.

### `.text:`
Used for storing all the program instructions.

### `.data:`
Has the program's constants named with a `label`.

### `.bss:`
Has the program's variables.

## Global `_start`
We need a starting point, defined by `_start` in a global variable.

## Syscalls
Used to ask something to the system (exit, write, read, etc.)
Does have different syntax : `syscall` or `int 0x80` (interrupt)

Before hand, we shall put the number associated to the action into the `eax register` (return)

Ex: `1` is for exit, `3` is for read, `4` is for write, see:
- [Mac OS Syscall numbers with shift (24)](https://opensource.apple.com/source/xnu/xnu-792.13.8/osfmk/mach/i386/syscall_sw.h)
- [Mac OS Syscall numbers w/out shift?](https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master)

## Compile with NASM
We use asm with the `elf32` architecture and specify input/output files. Only works under Linux with nasm.
```
nasm -f {elf32 | elf64} -o {output file} {input file}
```
Don't forget to create the executable !
```
ld -m elf_i386 -o hello_world.o -o hello_world
```
And run
```
./executable_name
```
