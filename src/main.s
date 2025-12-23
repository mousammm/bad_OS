org 0x7c00
bits 16

main:
    ; setup 
    mov ax,0
    mov ds,ax   ; keep track of start address of data segemnt
    mov es,ax   ; sets the start point of extra segment
    mov ss,ax   ; set the start address of stack

    mov sp,0x7c00
    mov si,os_boot_msg
    call print
    hlt

halt:
    jmp halt

print:
    push si
    push ax
    push bx

print_loop:
    lodsb 
    or al,al
    jz done_print

    mov ah, 0x0e
    mov bh, 0
    int 0x10

    jmp print_loop

done_print:
    pop bx
    pop ax
    pop si
    ret

os_boot_msg: db 'BAD_OS!', 0x0D, 0x0A, 0

times 510-($-$$) db 0
dw 0xAA55
