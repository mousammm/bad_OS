;
; Unitialize data: section .bss 
;

section .data 
    ; so if .bss feels too shaby 
    ; we could initialize a var with a default value 
    num2 db 3 dup(2)    ; put 2 three times
    ; remoember db is 1bytes so accessing a 32bit reg eax will give 0x00020202

section .bss ; block starting symbol
    num resb 3          ; reserve 3 bytes
    ; we could also do word double etc
    

section .text 
global _start

_start:
    ; 
    ; Moving data into .bss num variable
    ;

    ; x86 dont know how big num is (mov [num],1) is wrong
    ; so first we need to mov the data into a register,then move the register into num
    mov bl,1
    ; so moving 1 into bl says we are working with bytes size
    mov [num],bl
    ; so this num points to the 1st memory location
    ; num=1st num+1=2nd num+2=3rd
    ; so adding 1 represents offset of 8bit(ie; bl = 8bit)


    ;
    ; Exit
    ; 
    mov eax,1
    mov ebx,69
    int 0x80

;
; Compiling
;
; nasm -f elf -o .o .s
; ld -m elf_i386 -o out .o

