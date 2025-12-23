;
; Logical Operator
;

section .text
global _start

_start:

    ;
    ; AND & ( only 1 & 1 = 1)
    ;
    mov eax,0b1010  ;   1010
    mov ebx,0b1100  ;   1100
    and eax,ebx     ; & 1000 
    ; ie eax is 1000

    ;
    ; OR | (only 0 | 0 = 0 )
    ;
    mov eax,0b1010  ;   1010
    mov ebx,0b1100  ;   1100
    or eax,ebx      ; | 1110 
    ; ie eax is 1110
    
    ;
    ; NOT (flip all bits)
    ;
    not eax 
    ; now eax is 0001
    ; PRO: so eax is 32bit mean we set only 4bits 0001 but is mem it flip all bits of eax(32bit) register now we have a different value 
    ; ANS: & it with 
    and eax,0x0000000F  
    ; in hex a single value is 4bit 
    ; 0000000 7x4 = 28 bit are 0s
    ; and last 4bit are 1s
    ; its known as mask
    and eax,0xF
    ; now its better 
    ; so in hex we read from right to lest 
    ; so F by default means the last 4bit and else are auto set to 0s

    ;
    ; XOR (same as 0 but 1 xor 1 is 0)
    ;
    mov eax,0b1010 ;   1010
    mov ebx,0b1100 ;   1100
    xor eax,ebx    ; ^ 0110
    ; ie eax is 0110

    ; EXIT
    ;
    int 0x80
