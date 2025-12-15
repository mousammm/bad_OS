section .data
    msg db 'Hello world!', 0xA

section .text
    global _start

_start:
    ; print 
    mov eax, 4
    mov ebx, 1
    mov ecx, msg 
    mov edx, 4
    int 0x80
    
    ; exit
    mov eax, 1
    mov ebx, 69
    int 0x80
