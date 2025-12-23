;
; Comparision and Jump instruction
;

seciton .data
global _start

_start:
    mov eax,3
    mov ebx,2
    cmp eax,ebx
    ; this just sub and put the result in eflags
    ; sub gives up 3 outcome 3-2 = 1
    ; result is +ve 0 -ve
    ; +ve eax > ebx
    ; -ve eax < ebx
    ; 0   eax = ebx
    ; so what about -2-2=-4
    jl less ; jump if eax is less than ebx
    jmp end
    ; if there is no end label if will also execute the less: 
    ; now after end lable we can skip less: label

less:
    mov eax,10

end:
    int 0x80

JUMPS
jl      ; jump if eax is less than ebx 
je      ; jump if eax is equal than ebx 
jne     ; jump if eax is not equal than ebx 
jg      ; jump if eax is greater than ebx 
jge     ; greater than or equal to 
jle     ; less than or equal to 
jz      ; jmp if 0
jnz      ; jmp if not 0
