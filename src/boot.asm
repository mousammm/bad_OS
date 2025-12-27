bits 16
org 0x7c00

main:
    cli             ; Clear interrupts to set up segments safely
    ; set up stack segments and pointer (grows dowmward)
    xor ax, ax      ; more efficient than mov ax, 0
    mov ds, ax      ; Data segment = 0
    mov es, ax      ; Extra segement = 0
    mov ss, ax      ; Stack segment = 0
    mov sp, 0x7c00  ; Stack pointer starts just below bootloader
    sti             ; Re-enable interrupts

    ; Print initial messgae
    mov si, msg_loading
    call print_msg

    ; load next 512 bytes from disk to 0x7E00
    call load_next_sector

    ; Print success message
    mov si, msg_success
    call print_msg

    ; Jump to the loaded code at 0x7E00
    jmp 0x0000:0x7E00

halt:
    jmp halt

; =================== LOAD NEXT SECTOR ================
load_next_sector:
    pusha
    ; set up disk read parameter 
    mov ah, 0x02    ; Bios read sector function
    mov al, 1       ; number of sectors to read (1 sector = 512bytes)
    mov ch, 0       ; Cylinder number (0-based)
    mov cl, 2       ; Sector number (1-based, so sector 2)
    mov dh, 0       ; Head number 
    mov dl, 0x00    ; Drive number (0x80 = first drive number, 0x00 = first floppy)

    ; Set destination buffer
    mov bx, 0x7E00  ; ES:BX = 0x0000:0x7E00
    int 0x13        ; Call bios disk interrupt

    ; check for errors
    jc .disk_error  ; carry flag set on error

    ; verify sectors read 
    cmp al, 1
    jne .disk_error ; AL should contain number of sectors read

    popa
    ret
.disk_error:
    ; Print error message and hlt
    mov si, msg_disk_error
    call print_msg
    jmp halt

; ==================== PRINT ROUTINE ================
print_msg:
    pusha
    mov ah, 0x0E    ; Bios teletype fun
.print_char:
    lodsb           ; load byte from [si] into al
    test al, al
    jz .done        ; zero bytes means end of string
    int 0x10        ; print character
    jmp .print_char
.done:
    popa
    ret

; ==================== DATA ================
msg_loading: db 'Bootloader loaded at 0x7c00', 0x0D, 0x0A, 0
msg_success: db 'Loaded next sector at 0x7e00', 0x0D, 0x0A, 0
msg_disk_error: db 'Failed to load next sector at 0x7E00', 0x0D, 0x0A, 0

times 510-($-$$) db 0
dw 0xaa55
