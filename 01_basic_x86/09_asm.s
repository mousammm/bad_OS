;
; Division
;

section .text
global _start

_start:

    ;
    ; unsign division
    ;
    mov eax,11
    mov ecx,2
    div ecx
    ; eax = 5
    ; edx = 1

    
    ;
    ; Sign division
    ;
    mov eax,0xff ; -1
    mov ecx,2    ; 2
    idiv ecx     ; -1/2

    ;
    ; Exit
    ;
    int 0x80
