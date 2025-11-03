org 100h

.data
msg1 db 'YOUSAF$'
msg2 db '66160$'
msg3 db 'AI DEPT$'

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

    mov dl, 0Dh
    mov ah, 2
    int 21h
    mov dl, 0Ah
    mov ah, 2
    int 21h

    mov dx, offset msg3
    mov ah, 9
    int 21h

    mov ah, 4Ch
    int 21h

end main
