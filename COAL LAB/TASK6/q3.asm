mov ax, 0FFFh
mov bx, 0
mov cx, 6
jmp shift_loop
exit:
mov dx, ax
shift_loop:
add ax, ax
add bx, bx
dec cx
jnz shift_loop
jmp exit