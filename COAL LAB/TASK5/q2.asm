.model small
.stack 100h

.data

.code
main proc
    mov cx, 26       ; Loop 26 times
    mov dx, 97       ; ASCII for 'a'
    
L1:
    mov ah, 2
    int 21h
    inc dx           ; same as add dx, 1
    loop L1
    
    mov ah, 4Ch
    int 21h
main endp

end main
