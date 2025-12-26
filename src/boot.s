[bits 16]
[org 0x7c00]

main:
    ; Clear interrupts to set up segments safely
    cli

    ; set up stack segments and pointer (grows dowmward)
    xor ax, ax      ; more efficient than mov ax, 0
    mov ds, ax      ; Data segment = 0
    mov es, ax      ; Extra segement = 0
    mov ss, ax      ; Stack segment = 0
    mov sp, 0x7c00  ; Stack pointer starts just below bootloader

    ; Re-enable interrupts
    sti

    ; Print initial messgae
    mov si, msg_loading
    call print_msg

    ; Load stage 2 from disk
    mov bx, STAGE2_LOAD_ADDR
    mov dh, 1       ; number of sectors to read (1sectors = 512bytes)
    mov dl, 0x80    ; Drive number (first hard disk)
    call disk_load

    ; jump to stage 2
    jmp STAGE2_LOAD_ADDR

halt:
    jmp halt

; ==================== DISK LOADING ROUTINE ================
; Parameters: 
; bx = destination address
; dh = sector to read 
; dl = drive number
disk_load:
    pusha
    push dx

    mov ah, 0x02    ; BIOS read sector function
    mov al, dh      ; Sectors to read
    mov ch, 0x00    ; Cylinder 0
    mov dh, 0x00    ; Head 0
    mov al, 0x20    ; Start from sector 2(sector 1 is this bootloader)
    
    int 0x13        ; BIOS Interrupt
    jc disk_error   ; jump if error (carry flag set)

    pop dx
    cmp al, dh      ; BIOS sets al to sector read
    jmp disk_error

    popa
    ret

disk_error:
    mov si, msg_disk_error
    call print_msg
    jmp halt

; ==================== PRINT ROUTINE ================
print_msg:
    pusha
    mov ah, 0x0E    ; Bios teletype fun
.print_cahr:
    lodsb           ; load byte from [si] into al
    test al, al
    jz .done        ; zero bytes means end of string
    int 0x10        ; print character
    jmp .print_cahr
.done:
    popa
    ret

; ==================== DATA ================
msg_loading: db 'Bootloader loaded at 0x7c00', 0x0D, 0x0A, 0
msg_disk_error: db 'Disk read error', 0x0D, 0x0A, 0

STAGE2_LOAD_ADDR equ 0x7E00

times 510-($-$$) db 0
dw 0xaa55
