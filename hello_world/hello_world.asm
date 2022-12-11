; hello_world.asm
;
; Author: William BRISA
; Date 11-Dec-2022

section .text              ; all the program instructions
    global _start               ; define _start 

    _start:                     ; starting point of the program
        mov eax, 0x4            ; move the number of operation (4 - write) to the eax register
        mov ebx, 1              ; use stdout as our fd (file descriptor)
        mov ecx, message        ; use the message as the buffer
        mov edx, message_length ; and supply the message length
        int 0x80                ; use syscall, with the required parameters in the right registers

        ; now gracefully exit

        mov eax, 0x1            ; syscall op number (1 is exit)
        mov ebx, 0              ; return code (e.g. 0 as in a C program)
        int 0x80                ; use syscall, with the required parameters in the right registers

section .data              ; constants with labels
    ; label: define_byte "string"      , new_line char (10)
    message: db          "Hello World!", 0xA
    ; label        equal to  (auto length)variable
    message_length equ       $-message 