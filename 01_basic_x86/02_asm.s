; Store Data
; acces data in register

section .data 
    num1 db 5       ; db 1byte
    num2 dw 5       ; dw 2byte
    num3 dd 5       ; dw 4byte
    num4 dq 5       ; dw 8byte
    ;num5 dt 5       ; dw 10byte

section .text
global _start

_start:
    mov eax,1
    mov ebx,num4    ; num4 is the address on stack
    mov ebx,[num4]  ; num4 is 5 (x/x $ebx in gdb)
    int 0x80


; Compiling 
; nasm -f elf -o out.o file.s
; ld -m elf_i386 -o out out.o
