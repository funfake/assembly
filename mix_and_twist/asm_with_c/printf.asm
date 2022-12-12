; printf.asm
; Uses printf from C
;
; Author: NanoDano at DevDungeon.com
; Date 29-Jul-2015
;
; Compile command: nasm -f elf64 -o printf.o printf.asm
; Link with gcc because using C: gcc printf.o
; Exec: ./a.out

; Define printf as an external function
extern	printf

section .data
    msg:	db "Hello world", 0 ; Zero is Null terminator 
    fmt:    db "%s", 10, 0 ; printf format string follow by a newline(10) and a null terminator(0), "\n",'0'

section .text
    global main

    main:
        push rbp ; Push stack

        ; Set up parameters and call the C function
        mov	rdi,fmt
        mov	rsi,msg
        mov	rax,0
        ; https://stackoverflow.com/questions/36007975/compile-error-relocation-r-x86-64-pc32-against-undefined-symbol
        ; "WRT" means "With Respect To ...", i.e, "in the context of ..."
        call    printf WRT ..plt

        pop	rbp		; Pop stack

        mov	rax,0	; Exit code 0
        ret			; Return