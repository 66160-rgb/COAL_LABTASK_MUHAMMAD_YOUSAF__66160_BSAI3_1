org 100h

start:
    mov ax, 3
    add ax, 1
    mov ax, 2
    mov bx, 3
    sub bx, ax
    add ax, bx

    mov ax, 4C00h
    int 21h

end start
