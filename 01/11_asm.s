;
; Shifts
;

section .text
global _start

_start:

    ;
    ; Shift right
    ;
    mov eax,2
    shr eax,1   ; 0010 -> 0001
    ; ie eax is 0001 
    ; shift is like div by 2

    eax eax,12
    shr eax,3
    ; eax is 4

    ;
    ; Shift left 
    ;
    mov eax,2
    shl eax,1
    ; it moltiply by 2 

    ; below this preserve the sign for us
    SAL
    SAR

    ;
    ; NOTES
    ;
    ; if div is not by 2 use DIV else use shift

