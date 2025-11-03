org 100h

start:                   
    mov ax, 5
    mov bx, 4
    add ax, bx
    mov cx, 2

    mov ax, 4C00h
    int 21h

end start
