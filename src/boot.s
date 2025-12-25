bits 32

section .text
    ALIGN 4
    dd 0x1BADB002   ; magic number
    dd 0x00000000   ; flags 0 for now
    dd -(0x1BADB002 + 0x00000000)   ; checksum

global start
extern kmain

start:
    cli
    mov esp, stack_space
    call kmain
    hlt

haltKernel:
    cli
    hlt
    jmp haltKernel

section .bss
resb 8192
stack_space:
