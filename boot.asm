bits 16
org 0x7c00

start:
    ; Clear screen - set text mode 80x25
    mov ax, 0x0003
    int 0x10
    mov si, 0

print:
    mov ah, 0x0e
    mov al, [hello + si]
    int 0x10
    add si, 1
    cmp [hello + si], 0
    jne print 

hello:
    db "hello world!", 0

times 510 - ($ - $$) db 0
dw 0xAA55
