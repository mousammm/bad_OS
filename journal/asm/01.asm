; question
; ==================================================

; lables these are address
my_function:        ; address 0x10
_start:             ;  ""
main:               ;  ""
my_cool_entry:      ;  ""

section .text 
    global _start 
; so _start is a label (address)
; we could call this or access it like a pointer
; global export this _start lable
; without the _ we have to tell the ld 
    ; ld -m elf_i386 -e start file1.o -o program1  # "-e start" is KEY

; ==================================================

; SECTIONS
; create division 
    ; the ld needs to know what goes where
    ; we can only define var at one section
    ; only have unilitilized variables in another section
    ; have the int main() or _start in another section

section         ; Empty name! (defaults to .text)
section .data   ; treated as standard section 
section  data   ; user-defined section
; .data gets DEFAULT attributes: writable, allocatable
; data gets NO default attributes!

; NASM KNOWS these (with dots!):
section .text      ; Default: alloc, exec
section .data      ; Default: alloc, write  
section .bss       ; Default: alloc, write, uninitialized
section .rodata    ; Default: alloc
section .comment   ; Default: (ignored)

; WITHOUT dots - NASM goes: "I don't know this!"
section text       ; User-defined, no defaults
section data       ; User-defined, no defaults

; ==================================================

; variables
; db  - Define Byte        (8 bits)  -> Characters, small numbers
; dw  - Define Word        (16 bits) -> Medium numbers
; dd  - Define Doubleword  (32 bits) -> Normal integers, pointers
; dq  - Define Quadword    (64 bits) -> Big integers, doubles
; dt  - Define Tenbytes    (80 bits) -> Extended precision float
; times X db Y            -> Repeat Y, X times
