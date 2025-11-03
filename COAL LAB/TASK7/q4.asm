.model small
.stack 100h
.data
string db 'YOUSAF'
.code
main proc
    mov ax, @data
    mov ds, ax
    mov si, offset string
    mov cx, 6

L1:
    mov bl, [si]
    mov bh, 0
    push bx
    inc si
    loop L1

    mov cx, 6

L2:
    pop dx
    mov ah, 2
    int 21h
    loop L2

    mov ah, 4Ch
    int 21h
main endp
end main
