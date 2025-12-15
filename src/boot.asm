bits 16                     ; we are in 16 bit real mode
org 0x7c00                  ; origin of our code

start:
    cli                    ; clear interrupts
    mov ax, 0x00
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00
    sti                     ; enable interrupts back ( so the above code will executes with no interrupts)
    mov si, msg

    ; ...    | code starts here and go upwards
    ; 0x7c00 |
    ; ....   | call stack will grow downwards
    ; ....   |
    ; 0x00   v

; will use bios function to print character
; in real mode we can access them via software inturrupts
; 0x10 fun with AH = 0xE to display char

print:                      ; loop to print msg
    lodsb                   ; loads bytes at ds:si (segment:ofset) to AL register and increment SI
    cmp al, 0
    je done
    mov ah, 0x0E
    int 0x10
    jmp print

done:
    cli 
    hlt                     ; stop cpu futher execution

msg: db 'Hello world!', 0

times 510 - ($ - $$) db 0
dw 0xAA55
