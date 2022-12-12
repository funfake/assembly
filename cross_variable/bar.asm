; bar.asm
; Uses external variable defined in another C file
;
; Author: ADIApproved at ez.analog.com
; Date 17-May-2010

section .text
    global _bar
    extern _global_var  ; get external variable defined in C program
    extern _global_var_length

    _bar:
        mov rax, 0x4                    ; move the number of operation (4 - write) to the eax register
        mov rbx, 1                      ; use stdout as our fd (file descriptor)
        mov rcx, _global_var            ; use the message as the buffer
        mov rdx, 5     ; and supply the message length
        int 0x80                        ; use syscall, with the required parameters in the right registers
        ret                             ; return (to C program)