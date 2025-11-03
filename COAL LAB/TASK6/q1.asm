mov ax, 0
mov bx, 7
mov cx, 2
jmp loop_start
increment:
inc ax
add cx, bx
loop_start:
cmp ax, bx
jl increment