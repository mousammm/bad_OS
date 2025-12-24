org 0x7c00
bits 16

main:
    ; setup 
    mov ax,0    ; set ax to 0 so we can reset few other register
    mov ds,ax   ; keep track of start address of data segemnt
    mov es,ax   ; sets the start point of extra segment
    mov ss,ax   ; set the start address of stack

    mov sp,0x7c00   
    ; stack grows downward 
    ; we are starting just after our code
    mov si,os_boot_msg
    call print
    hlt

halt:
    jmp halt

print:
    ; first we need to preserver the value of register 
    ; that we are going to be working in here 
    push si
    push ax
    push bx

; load data from our string into memory 
; and print char by char
print_loop:
    lodsb       
    ; load 1byte from the si register
    ; and put it in al register
    or al,al
    ; checking if char in al is 0 
    ; as or set 0 when 0 | 0 = 0
    jz done_print
    ; if al is 0 jmp to done print

    ; if al is not 0 it means it is a char so now print it
    mov ah, 0x0e    ; interrupt for printing to screeen
    mov bh, 0       ; bh is page number (if we have multiple monitior) ignore
    int 0x10        
    ; call 0x10 which is video interrupt
    ; it print the value in al

    jmp print_loop
    ; so if we are here then we didnt reach 0 so do it again

done_print:
    ; pop the register that we preserver in print lable
    pop bx
    pop ax
    pop si
    ret     ; return to line 40

os_boot_msg: db 'BAD_OS! has booted', 0x0D, 0x0A, 0

times 510-($-$$) db 0
dw 0xAA55

;
; Compiling
;
; nasm main.s -f bin -o main.bin
; cp main.bin main.img
; truncate -s 1440k main.img
; qemu-system-i386 -fda main.img
