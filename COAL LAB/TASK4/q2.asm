org 100h

main:
    mov ax, 5
    mov bx, 3
    add ax, bx
    jmp last

mid:
    mov ax, 1
    mov bx, 2
    add ax, bx
    jmp first

last:
    mov ax, 3
    mov bx, 3
    add ax, bx
    jmp mid

first:
    hlt

end main
