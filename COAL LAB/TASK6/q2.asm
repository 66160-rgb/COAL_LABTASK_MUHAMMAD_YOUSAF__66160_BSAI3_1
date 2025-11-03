mov ax, 9
mov bx, 4
mov dx, 0
jmp division
done:
mov cx, ax
mov ax, dx
jmp end
division:
sub ax, bx
inc dx
cmp ax, bx
jge division
jmp done
end: