; uppercaseLast.asm
; Has string passed and returns it with last char of a sequence uppercased
;
; Author: William BRISA
; Date 13-Dec-2022

section .text
    global uppercaseLast

    uppercaseLast:
        ; prologue
        push ebp            ; save caller's frame pointer
        mov ebp, esp        ; set own frame pointer (base pointer <- actual stack pointer)
        ; no need to allocate local variables

        ; function body
        mov eax, [ebp + 8]  ; argument - pointer to string

        loop1:
            mov dl, [eax]           ; read char from string (dl is a 8bit register perfect for 255 char)
            inc eax                 ; increment eax (loop's pointer)
            
            cmp dl, 'a'            ; compare al with "a"
            jl loop1                ; jump to next character if less (since it's less than "a")
            cmp dl, 'z'            ; compare al with "z"
            jg loop1                ; above "z" -> not a character
            ; tests passed
            ; dl holds a value
            ; eax holds an address

            cmp byte [eax], 'a'            ; compare al with "a"
            jl modify                ; jump to next character if less (since it's less than "a")

            cmp byte [eax], 'z'            ; compare al with "z"
            jg modify                ; above "z" -> not a character
            
            cmp byte [eax], 0x00; //check if next character is null
            jne loop1;

        modify:
            sub dl, 32
            mov byte [eax-1], dl

        ; epilogue - no need to discard locals
        mov eax, [ebp + 8]
        pop ebp             ; restore caller's frame pointer
        ret                 ; return

