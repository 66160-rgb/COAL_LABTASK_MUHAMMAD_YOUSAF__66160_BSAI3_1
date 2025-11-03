org 100h

start:
    mov bx, 4
    add bx, 3
    mov ax, 5
    sub bx, ax
    mov ax, 9
    mov bx, 6
    sub ax, bx
    mov bx, 4
    mov ax, 5
    add ax, bx

    mov ax, 4C00h
    int 21h

end start





