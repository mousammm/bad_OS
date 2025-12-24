org 0x7c00
; tells the asmbler relative to this address
bits 16
; every x86 processor boot in 16bit 
; which is real mode for backward compability

main:
    hlt
    ; pause the cpu 

halt:
    jmp halt
    ; so the cpu hlt until it reach a particular interrupt 
    ; but we dont want to resume 
    ; its a infinite jump 

; we need to write the signature at the end 
; assume every block of data is 512bytes
; its a floppy drive which is 1.44mb 
times 510-($-$$) db 0
; so we minus the size of our program with 510 which give us the remaning bytes 
; which we need to fill with 0 
dw 0xAA55
; this sets the last 2 bytes to the signature

;
; Compiling
;
; nasm main.s -f bin -o main.bin
; cp main.bin main.img
; truncate -s 1440k main.img
; qemu-system-i386 -fda main.img
