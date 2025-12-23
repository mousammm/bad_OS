; Working with 16bit and 8bit

genral register 
32bit:eax,ebx,ecx,edx
16bit: ax, bx, cx, dx
16bit: 8(higher) + 8(lower)

;
; 32bits
; lets mov 1 and 2
mov eax,1
mov ecx,2

; now see the reg  (in gdb x/x 0x804a000)
eax is 32bit: 00 00 02 01 (4 x 8bit)
02 01 in binary: 0000-0010 0000-0001

* we need only 1 which is 8bit but we got 32bit(eax)

;
; 8bits
;
Lower: middle to right 0000-1111 eg bl
Higher: middle to left 1111-0000 eg bh

* working with bh bl doesnt matter 
* but id acces eax it matter 
* bh(0010) + bl(0010) 
 * bh is 2 
 * bl is 2 
 * eax is 0010-0010: 0x22: 34
