.model small
.stack 100h

.data

.code
main proc
    mov cx, 5       ; Loop 5 times
    mov dx, 65      ; ASCII for 'A'
    
L1:
    mov ah, 2
    int 21h
    add dx, 1
    loop L1
    
    mov ah, 4Ch
    int 21h
main endp

end main
