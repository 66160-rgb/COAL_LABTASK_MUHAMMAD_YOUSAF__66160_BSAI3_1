org 100h

main:
    mov bl, 3
    mov cl, 1
    sub bl, cl
    add bl, 48
    mov dl, bl
    mov ah, 2
    int 21h

    mov ah, 4Ch
    int 21h

end main
