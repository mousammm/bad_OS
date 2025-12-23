;
; Comparing floating point numbers
;

section .data
    x dd 3.14
    y dd 2.1

section .text
global _start

_start:
    movss xmm0, [x]
    movss xmm1, [y]
    ucomiss xmm0,xmm1
    ; same as cmp set some eflags then we could do some jumps
    ; jumps will be differnet 
    ; jb  ; less than
    ; jbe ; less than or equal 
    ; ja  ; greater than
    ; jae ; greater that or equal
    ja big
    jmp end

big:
    mov ecx,1

end: 
    mov eax, 1
    mov ebx, 1
    int 0x80
