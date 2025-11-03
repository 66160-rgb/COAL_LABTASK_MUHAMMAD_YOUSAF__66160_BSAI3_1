org 100h

start:
    mov bx, 2
    add bx, 3
    mov ax, 5
    sub bx, ax
    mov ax, 7
    mov bx, 2
    add ax, bx
    mov bx, 5
    mov ax, 4
    add ax, bx

    mov ax, 4C00h
    int 21h

end start
