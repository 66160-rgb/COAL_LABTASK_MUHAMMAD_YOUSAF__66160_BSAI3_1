.model small
.stack 100h
.data
.code
main proc
    mov bx, 2
    mov cx, 4

outer:
    push cx
    mov cx, bx

inner:
    mov dl, '#'
    mov ah, 2
    int 21h
    loop inner

    mov dl, 13      ; carriage return
    mov ah, 2
    int 21h
    mov dl, 10      ; line feed
    mov ah, 2
    int 21h

    inc bl
    pop cx
    loop outer

    mov ah, 4Ch
    int 21h
main endp
end main
