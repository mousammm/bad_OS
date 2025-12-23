;
; Strings and Char list
;

; A-Z:65-90
; a-z:95-112
; 0-9:

section .data
    char db 'A'         ; char
    list db 1,2,3,4     ; list/array
    ; so this is mov in a register (mox eax, [list])
    ; eax(32bit): list is 1byte x 4 is 4byte/32bit
    ; in mem x/x 0x804a0000: 0x04030201
    ; all sorted from left to right  
    ; now do this in gdb (x/2x 0x804a0000): give the next 32bit 
    ; PRB:our list is sorted good so it fits in a 32bit register but if we have more than this we dont realy have a reliable way to know where the list ends
    ; ANS:we could put -1 at end if working with +ve no or put 0; we need something that indicates the end of the list (called null treminator)

    ;
    ; Strings
    ;
    name1 db "ABC", 0
    ; list of cahr is strings 
    ; in strings its easier we could put a 0 or 0xA(\n)
    name2 db "EFG", 0
    ; mow (x/3x 0x804a0000) get three 32bit address
    ; 0x804a0000: 0x00111111 0x00111111 0x00000000
    ; see the last 1byte is 0 well we use 3(1byte) cahr so it leaves enough space for the null terminator in a 32bit register

section .text 
global _start

_start:
    mov bl,[char]   ; exit status = cahr 
    mov eax,1       ; sys call exit
    int 0x80        ; call kernel

;
; Compiling 
;
nasm -f elf -o out.o file.s
ld -m elf_i386 -o out out.o
