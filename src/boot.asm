bits 16                     ; we are in 16 bit real mode
org 0x7c00                  ; origin of our code

; offset of code segment and data segment from gdt start
CODE_OFFSET equ 0x8         ; code segment descriptor in gdt start
DATA_OFFSET equ 0x10        ; data segment descriptor in gdt start

start:
    cli                     ; clear interrupts
    xor ax, ax               
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00          ; set stack pointer
    sti                     ; enable interrupts back

load_PM:
    cli                     ; clear interrupts
    lgdt [gdt_descriptor]   ; load gdt 

    ; enable protected mode
    mov eax, cr0            ; set one bit in control register
    or eax, 1               ; FIXED: Use eax instead of al to ensure entire register
    mov cr0, eax            ; now cr0 has protection mode enabled

    ; Far jump to flush pipeline and load CS with CODE_OFFSET
    jmp CODE_OFFSET:PModeMain

; GDT table 
gdt_start:
    dq 0x0                  ; 1st entry must be null (8 bytes)

    ; code segment descriptor (0x8)
    dw 0xFFFF               ; limit (0-15)
    dw 0x0000               ; base (0-15)
    db 0x00                 ; base (16-23)
    db 10011010b            ; Access byte: P=1, DPL=00, S=1, E=1, DC=0, RW=1, A=0
    db 11001111b            ; Flags: G=1, D/B=1, L=0, AVL=0 | Limit (16-19): 0xF
    db 0x00                 ; base (24-31)

    ; data segment descriptor (0x10)
    dw 0xFFFF               ; limit (0-15)
    dw 0x0000               ; base (0-15)
    db 0x00                 ; base (16-23)
    db 10010010b            ; Access byte: P=1, DPL=00, S=1, E=0, DC=0, RW=1, A=0
    db 11001111b            ; Flags: G=1, D/B=1, L=0, AVL=0 | Limit (16-19): 0xF
    db 0x00                 ; base (24-31)

gdt_end:
    
gdt_descriptor:
    dw gdt_end - gdt_start - 1  ; size of gdt - 1
    dd gdt_start                ; base address of gdt

bits 32
PModeMain:
    ; Initialize segment registers with data segment selector
    mov ax, DATA_OFFSET
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax                ; FIXED: Moved ss after others (optional but clean)

    ; set up stack
    mov ebp, 0x9C00           ; stack base pointer
    mov esp, ebp              ; stack pointer

    ; Enable A20 line
    in al, 0x92
    or al, 2
    out 0x92, al

    ; Optional: Clear screen and print a character to show it's working
    mov edi, 0xB8000          ; video memory address
    mov ah, 0x0F              ; white on black
    mov al, 'P'               ; character to display
    mov [edi], ax

    jmp $                     ; infinite jump
    

times 510 - ($ - $$) db 0
dw 0xAA55
