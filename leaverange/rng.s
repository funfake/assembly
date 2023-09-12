; leaverng.asm
;
; Author: ECOAR professor
; Date: 14-Dec-2022
;
; C prototype: char* leaverng(char* s, char a, char b);
; a < b: characters outside a..b range are removed from the string

section .text:
    global rng

    rng:
        push    ebp             ; save caller's frame pointer
        mov     ebp, esp        ; set frame pointer for argument access
        
        mov     ecx, [ebp+8]    ; source ptr
        mov     edx, ecx        ; dest ptr

        next_char:
            mov     al, [ecx]       ; load a character
            inc     ecx             ; advance src pointer
            test    al,al           ; check for trailing 0
            cmp     al, [ebp+12]    ; compare with arg. a
            jb      next_char       ; below a -> don't copy
            cmp     al, [ebp+16]    ; compare with arg. b
            ja      next_char       ; above b -> don't copy

        copy_char:                  ; just an entry point, will get executed in line
            mov     [edx], al       ; store character
            inc     edx             ; advance dest pointer
            jmp     next_char       ; 

        finish:
            mov     [edx], al       ; put trailing 0 at the current end of
            mov     eax, [ebp+8]    ; return argument as function value

            pop     ebp             ; restore
            ret


