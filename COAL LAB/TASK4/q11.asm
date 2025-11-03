mov ax,3
mov bx,2
cmp ax,bx
jz move
jnz exit
move:
mov dx,9
exit:
mov ax,0x4c00
int 0x21