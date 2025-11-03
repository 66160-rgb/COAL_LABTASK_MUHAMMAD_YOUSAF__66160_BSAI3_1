include 'emu8086.inc'
.model small
.stack 100h
.data
.code
main proc
    mov ax, 7
    mov bx, 9
    cmp ax, bx
    jg greater

    mov ax, 2
    print '2'

greater:
    mov ax, 8
    print '8'

    mov ah, 4Ch
    int 21h
main endp
end main
