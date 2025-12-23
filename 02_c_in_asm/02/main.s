
;
; compiling
;

; nasm -f elf -o main.o main.s ^C
; gcc -no-pie -m32 main.o main.c -o out^C

extern test 
extern exit

section .data
section .text
global main

main:
    push 1
    push 2
    call test
    ; eax stores the result

    push eax
    call exit
