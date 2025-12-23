;
; Floating point 
; they can fit in 32bit (good for x86)
; double needs 64bit

section .data
    x dd 3.14
    y dd 2.1

section .text
global _start

_start:
    movss xmm0, [x]
    movss xmm1, [y]
    addss xmm0, xmm1
    ; s:scaler 
    ; s:singler presion(32bit floating point number)
    ; xmm[0-15] special register for floating point

    ;
    ; EXIT
    ;
    mov ebx, 1
    int 0x80

; decimal num are not quite accurate 
; ieee is a notation used to represent floating point as close as possible 
