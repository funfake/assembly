; mystrlen.asm
; Has parameters passed and returns an int
;
; Author: Baptiste Le Sciellour
; Date 12-Dec-2022

section .text
    global mystrlen

    mystrlen:
        ; prologue
        push rbp            ; save caller's frame pointer
        mov rbp, rsp        ; set own frame pointer (base pointer <- actual stack pointer)
        ; no need to allocate local variables

        ; function body
        mov rax, [rbp + 8]  ; argument - pointer to string

        loop1:
            mov dl, [rax]   ; read char from string (dl is a 8bit register perfect for 255 char)
            inc rax         ; increment rax (loop's pointer)
            test dl, dl     ; test if byte == 0 (we want to count how much char there are)
            jnz loop1       ; no - get next char (if it's a valid char then jump to the next one)
            dec rax         ; back the ptr by 1 (cause: from 0 to n-1)
            sub rax, [rbp+8]; substract the string starting address
                            ; function value read in rax
        
        ; epilogue - no need to discard locals
        pop rbp             ; restore caller's frame pointer
        ret                 ; return

