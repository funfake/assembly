; say_hi.asm
;
; Author: William BRISA
; Date 12-Dec-2022
;
; Compile command: nasm say_hi.asm -f elf64
;
; Link to test as standalone program: ld -m elf_x86_64 -o say_hi say_hi.o
; will need global say_hi to be changed to _start, add exit syscall and remove ret

section .text              ; all the program instructions
    global say_hi               ; define _start 

    say_hi:                     ; starting point of the program
        mov eax, 0x4            ; move the number of operation (4 - write) to the eax register
        mov ebx, 1              ; use stdout as our fd (file descriptor)
        mov ecx, message        ; use the message as the buffer
        mov edx, message_length ; and supply the message length
        int 0x80                ; use syscall, with the required parameters in the right registers
        ret                     ; return (to C program)

section .data              ; constants with labels
    ; label: define_byte "string"      , new_line char (10)
    message: db          "Hello World!", 0xA
    ; label        equal to  (auto length)variable
    message_length equ       $-message 