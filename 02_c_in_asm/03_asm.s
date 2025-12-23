; 
; Function 
;

section .data

section .text
global main

addTwo:
    add eax,ebx
    ret

main:
    mov eax,5
    mov ebx,3
    call addTwo
    mov ebx,eax     ; preserve the value 

    ;
    ;Exit
    ;
    mov eax,1
    int 0x80
