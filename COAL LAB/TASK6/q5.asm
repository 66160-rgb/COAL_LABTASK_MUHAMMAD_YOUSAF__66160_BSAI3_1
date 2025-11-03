mov ax, 1
mov bx, 1
mov cx, 6
jmp fib
done:
mov dx, bx
hlt

fib:
mov si, ax
mov ax, bx
add bx, si
dec cx
jnz fib
jmp done
