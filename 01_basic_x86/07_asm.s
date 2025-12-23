;
; SUB
;

; sub is easier then add
; as the result is smaller
; but we do need to think about -ve num

section .data 
section .text
global _start

_start:

    ; ######
    mov eax,5
    mov ebx,3
    sub eax,ebx     ; eax = eax-ebx
    ; this was easy eax is 2

    ; ######
    mov eax,3
    mov ebx,5
    sub eax,ebx     ; eax = eax-ebx
    ; ok we got -2 
    ; but look at the hex value 0xffffffffe 
    ; the hex value can be -2 or a large number
    ; so how does the it know its -2
    ; it know to print -2 because of the eflags 
    ; SF(sign flag): the operation produes a -ve output

    ; ######
    mov ebx,2
    ; eax is -2
    add eax,ebx     ; eax = -2 + 2
    ; yes it is 0

    ;
    ; exit
    ; 
    int 0x80

;
; compiling 
;
; nasm -f elf -o .o .s
; ld -m elf_i386 -o out .o
