; mystrlen.asm
; Has parameters passed and returns an int
;
; Author: Baptiste Le Sciellour
; Date 12-Dec-2022

section .text
    global mystrlen

    mystrlen:
        ; prologue
        push ebp            ; save caller's frame pointer
        mov ebp, esp        ; set own frame pointer (base pointer <- actual stack pointer)
        ; no need to allocate local variables

        ; function body
        mov eax, [ebp + 8]  ; argument - pointer to string

        loop1:
            mov dl, [eax]   ; read char from string (dl is a 8bit register perfect for 255 char)
            inc eax         ; increment eax (loop's pointer)
            test dl, dl     ; test if byte == 0 (we want to count how much char there are)
            jnz loop1       ; no - get next char (if it's a valid char then jump to the next one)
            dec eax         ; back the ptr by 1 (cause: from 0 to n-1)
            sub eax, [ebp+8]; substract the string starting address
                            ; function value read in eax
        
        ; epilogue - no need to discard locals
        pop ebp             ; restore caller's frame pointer
        ; now gracefully exit
        mov eax, 0x1            ; syscall op number (1 is exit)
        mov ebx, 0              ; return code (e.g. 0 as in a C program)
        int 0x80                ; use syscall, with the required parameters in the right registers

