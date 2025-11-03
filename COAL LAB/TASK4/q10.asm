mov ax,1
cmp ax,9
js add
jns exit
add:
mov ax,4
exit:
mov ax,0x4c00
int 0x21