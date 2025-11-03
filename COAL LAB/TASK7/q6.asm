.model small
.stack 100h
.data
array db 'x', 'y', 'z', '$'
.code
main proc
    mov ax, @data
    mov ds, ax
    mov si, offset array
    mov cx, 3

L1:
    mov dl, [si]
    mov ah, 2
    int 21h
    inc si
    loop L1

    mov ah, 4Ch
    int 21h
main endp
end main
