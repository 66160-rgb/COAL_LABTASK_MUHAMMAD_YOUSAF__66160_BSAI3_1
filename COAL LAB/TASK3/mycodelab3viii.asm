org 100h

main:
    ; Read 1st digit
    mov ah, 1
    int 21h
    mov bl, al
    sub bl, 48

    ; Read 2nd digit
    mov ah, 1
    int 21h
    mov cl, al
    sub cl, 48

    ; Calculate sum and print
    add bl, cl
    add bl, 48
    mov dl, bl
    mov ah, 2
    int 21h

    mov ah, 4Ch
    int 21h

end main
