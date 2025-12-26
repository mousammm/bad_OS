[bits 16]
[org 0x7c00]

main:
    hlt

halt:
    jmp halt

times 510-($-$$) db 0
dw 0xaa55
