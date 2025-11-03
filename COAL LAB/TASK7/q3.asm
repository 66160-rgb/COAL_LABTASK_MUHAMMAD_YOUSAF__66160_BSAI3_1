.model small
.stack 100h
.data
string db 'Junaid'
.code
main proc
mov ax, @data
mov ds, ax
mov si, offset string
mov cx, 6
l1:
mov bl, [si]
mov bh, 0
push bx
inc si
loop l1
mov cx, 6
l2:
pop dx
mov ah, 2
int 21h
loop l2
mov ah, 4ch
int 21h
main endp
end main