;
; Calling c function
;

; sudo pacman -S lib32-gcc-libs
; nasm -f elf -o out.o file.s
; gcc -no-pie -m32 out.o -o out

; std c fun printf etc
; we will run nasm obj file through gcc 
; ie we need main: label

extern printf
extern exit

section .data
    ; printf(fmt,msg)
    msg1 dd "hello", 0
    msg2 dd "world!", 0
    fmt db "output is: %s %s",10,0

section .text
global main

main:
    ; push data on to stack
    ; stack is last in first out 
    ; so we need fmt first and msg second
    ; so we pust msg first and fmt second 
    push msg2
    push msg1
    push fmt
    call printf

    ; exit(1)
    push 1
    call exit
