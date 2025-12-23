;
; Mul 
;

start .text 
global _start

_start:

    ; ######
    mov al,2
    mov bl,3
    mul bl      ; al = al * bl
    ; mul is on unsign value 
    ; it required one operand
    ; the one operand is the register beside the a which is bl
    ; a register: is a accumulator a default destination for operation like mul

    ; ######
    ; what is result is bigger 
    mov al,0xFF
    mov bl,2
    myl bl
    ; al 0xfe   -2
    ; ah 0x1     1
    ; ax 0x1fe  510
    ; so the mul operand will expand itself to fit

    
    ; imul sign value
    mov al,0xff
    mov bl,2
    imul bl
    ; al 0xff(255) but is -1(in sign)
    ; ah 2 
    ; al -2
