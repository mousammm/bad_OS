; Compare two values
cmp eax, ebx    ; Compare eax with ebx

; Conditional jumps (based on cmp)
je  label       ; Jump if EQUAL
jne label       ; Jump if NOT equal
jg  label       ; Jump if GREATER
jl  label       ; Jump if LESS
jge label       ; Jump if GREATER OR EQUAL
jle label       ; Jump if LESS OR EQUAL

; =========================================================

; loops
section .text
global _start

_start:
    ; Print 5 stars using a loop
    mov ecx, 5          ; Counter = 5
    
print_star:
    ; Save counter (push to stack)
    push ecx
    
    ; Print one star
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, star       ; Pointer to '*'
    mov edx, 1          ; 1 character
    int 0x80
    
    ; Restore counter (pop from stack)
    pop ecx
    
    ; Decrement and loop if not zero
    loop print_star     ; ecx--; if ecx != 0: jump
    
    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
    
    ; Exit
    mov eax, 1
    mov ebx, 0
    int 0x80

section .data
star    db '*'
newline db 0xA

; =========================================================

; Stack operations
push eax      ; Save eax on stack
push ebx      ; Save ebx on stack
; ... do work ...
pop ebx       ; Restore ebx (LAST in, FIRST out!)
pop eax       ; Restore eax

; ESP register always points to TOP of stack

; =========================================================

; Call a function
call my_function  ; 1. Push return address on stack
                  ; 2. Jump to my_function

my_function:
    ; Function code
    mov eax, 42
    ret           ; 1. Pop return address from stack
                  ; 2. Jump back to caller

; =========================================================

; System call = "Ask OS to do something"
mov eax, 1      ; sys_exit = 1
mov ebx, 42     ; Exit code = 42
int 0x80        ; "Ring the doorbell!" (interrupt)

; Common system calls:
; 1 = exit, 2 = fork, 3 = read, 4 = write, 5 = open
; 6 = close, 11 = execve, 12 = chdir, 19 = lseek

; now if u use eax or edx to store or whaterver calculatio
; at the end u have to do 

; EXITING PART
; eax/ebx (exit num)

; Common system call numbers:
; 0 = restart_syscall    (rare)
; 1 = exit               (LEAVE!)
; 2 = fork               (Create child process)
; 3 = read               (Read from file/keyboard)
; 4 = write              (rite to file/screen)
; 5 = open               (Open a file)
; 6 = close              (Close a file)
; 11 = execve            (Run another program)
