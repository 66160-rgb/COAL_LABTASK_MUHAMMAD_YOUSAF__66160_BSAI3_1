.model small
.stack 100h

.data

.code
main proc
    mov bx, 26
    mov dl, 65
    
UpperLoop:
    mov ah, 2
    int 21h
    inc dl
    dec bx
    jnz UpperLoop

    ; New line
    mov dl, 13
    mov ah, 2
    int 21h
    mov dl, 10
    mov ah, 2
    int 21h

    mov bx, 26
    mov dl, 97

LowerLoop:
    mov ah, 2
    int 21h
    inc dl
    dec bx
    jnz LowerLoop

    mov ah, 4Ch
    int 21h
main endp
end main
