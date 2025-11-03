.model small
.stack 100h
.data
.code
main proc
mov bx, 1
mov cx, 5
outer_loop:
push cx
mov cx, bx
mov dl, 'A'
inner_loop:
mov ah, 2
int 21h
inc dl
loop inner_loop
mov dl, 10
mov ah, 2
int 21h
mov dl, 13
mov ah, 2
int 21h
inc bl
pop cx
loop outer_loop
mov ah, 4ch
int 21h
main endp
end main