;
; Arithemetic Opertion
; ADD, ADC and EFLAGS
;

section .data
section .text
global _start

_start:

    ; #####
    mov eax,1
    mov ebx,2
    add eax,ebx     ; eax = eax + ebx

    ;
    ; EFLAGS
    ;
    PF(parody flag): when the value is an odd num
    IF(interrupt flag): ahhh
    ; gives info about the operation that was just run
    ; 0/1 = off/on (for flags)

    ; ######
    mov al,0b11111111   ;  1111 1111
    mov bl,0b0001       ;  +    0001
    add al,bl           ; 10000 0000
    ; the one in the 9th bit it goes in CF eflags 
    ; so how do we get the value out of carry 

    ;
    ; ADC
    ;
    adc ah,0
    ; adc: same as add but add the carry in it 
    ; so we were using al so the 9th bit is in ah register 
    ; ah = 0001 + 0000 = 0001

    ;
    ; Exit
    ;
    int 0x80
