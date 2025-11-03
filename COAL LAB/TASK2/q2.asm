org 100h

start:
    mov bx, 1
    add bx, 4
    mov ax, 4
    sub bx, ax
    mov ax, 6
    mov bx, 3
    add ax, bx
    mov bx, 4
    mov ax, 5
    add ax, bx

    mov ax, 4C00h
    int 21h

end start
