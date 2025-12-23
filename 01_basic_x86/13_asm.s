;
; Loops 
;

section .data
    list db 1,2,3,4

section .text
global _start

_start:
    mov eax,0   ; int i = 0
    mov cl,0    ; sum = 0

loop:
    mov bl,[list + eax]     ; bl get the value of the list in current index
    add cl,bl               ; add the value to cl reg
    inc eax                 ; i++ ; add eax,1 
    cmp eax,4               ; check if we reach the end
    ; so in cmp we use a static value oe use NULL terminator
    je end                  ; if we reach the end go to end: label
    jmp loop                ; else repeat itself

end:
    mov eax,1
    mov ebx,0
    int 0x80

;
; Compiling
;
;nasm -f elf -o .o .s
;ld -m elf_i386 -o out .o
