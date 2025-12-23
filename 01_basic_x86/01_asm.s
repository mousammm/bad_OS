; Sections and lables 

section .data   ; stores variables  
section .text   ; actual code 
global _start   ; export _start lable 

_start:         ; create a lable
    mov eax,1   ; sys call exit
    mov ebx,1   ; exit status code 1
    int 0x80    ; call the kernel

; Compiling 
; nasm -f elf -o out.o 01_asm.s
; ld -m elf_i386 -o out out.o
    ; elf_i386: use 32bit 
