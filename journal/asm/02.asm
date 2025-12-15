; cpu instructions
; used in _start
; all x86 follows: instruction DESTINATION, SOURCE

; ===== BASIC "ROBOT COMMANDS" =====

; 1. MOV - The MOVE command (most used!)
mov eax, 5       ; "Robot, put 5 in register EAX"
mov ebx, eax     ; "Copy what's in EAX to EBX"

; 2. ADD/SUB - MATH commands
add eax, 10      ; "EAX = EAX + 10"
sub ebx, 5       ; "EBX = EBX - 5"

; 3. MUL/DIV - Multiply/Divide
mul ebx          ; "EAX = EAX * EBX" (special!)
div ecx          ; "EAX = EAX / ECX" (special!)

; 4. INC/DEC - Increment/Decrement
inc eax          ; "EAX = EAX + 1"
dec ebx          ; "EBX = EBX - 1"

; from the above patten we can all the function 
; at the end result will be in eax

; ===================================

; The CPU has only 14 general-purpose registers (like built-in variables):

; 32-bit: EAX, EBX, ECX, EDX, ESI, EDI, ESP, EBP
; 16-bit:  AX,  BX,  CX,  DX,  SI,  DI,  SP,  BP
;  8-bit:  AL,  AH,  BL,  BH,  CL,  CH,  DL,  DH
  
; EAX = "Accumulator" (main work register)
; EBX = "Base" (pointer to data)
; ECX = "Counter" (for loops)
; EDX = "Data" (extends EAX for multiplication)
; ESI = "Source Index" (for string operations)
; EDI = "Destination Index" (for string operations)
; ESP = "Stack Pointer" (points to stack top)
; EBP = "Base Pointer" (points to stack frame)

; EAX (32-bit)
; │
; ├── AX (16-bit)
; │   │
; │   ├── AL (8-bit, LOW byte)
; │   └── AH (8-bit, HIGH byte)

mov eax, 0x12345678  ; eax = 0x12345678
; AX = 0x5678
; AL = 0x78
; AH = 0x56

; =========================================================

