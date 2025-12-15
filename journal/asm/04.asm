Data Movement:
  mov  dest, src    ; Copy src to dest
  push src          ; Push onto stack
  pop  dest         ; Pop from stack
  xchg a, b         ; Swap a and b

Arithmetic:
  add  dest, src    ; dest = dest + src
  sub  dest, src    ; dest = dest - src
  inc  dest         ; dest = dest + 1
  dec  dest         ; dest = dest - 1
  mul  src          ; eax = eax * src
  div  src          ; eax = eax / src

Logic:
  and  dest, src    ; Bitwise AND
  or   dest, src    ; Bitwise OR
  xor  dest, src    ; Bitwise XOR
  not  dest         ; Bitwise NOT

Control Flow:
  jmp  label        ; Unconditional jump
  call label        ; Call function
  ret               ; Return from function
  cmp  a, b         ; Compare a and b
  je   label        ; Jump if equal
  jne  label        ; Jump if not equal
  jg   label        ; Jump if greater
  jl   label        ; Jump if less
  loop label        ; Decrement ecx, jump if ≠0
