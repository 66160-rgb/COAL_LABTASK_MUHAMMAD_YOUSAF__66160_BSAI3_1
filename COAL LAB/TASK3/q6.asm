org 100h

.data
msg1 db 'AI STUDENT$'
msg2 db 'RIPHAH UNIVERSITY$'

.code
main:
    mov ax, cs
    mov ds, ax

    mov dx, offset msg1
    mov ah, 9
    int 21h

    mov dl, 0Dh
    mov ah, 2
    int 21h
    mov dl, 0Ah
    mov ah, 2
    int 21h

    mov dx, offset msg2
    mov ah, 9
    int 21h

    mov ah, 4Ch
    int 21h

end main
