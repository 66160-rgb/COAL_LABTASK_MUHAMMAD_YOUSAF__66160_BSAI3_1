include 'emu8086.inc'
.model small
.stack 100h

.data
msg1 db 'Number is equal$', 0
msg2 db 'Number is not equal$', 0

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Expected number
    mov dl, '3'

    ; Get user input
    mov ah, 1
    int 21h        ; AL = user input

    ; Compare input with '3'
    cmp al, dl
    je equal

    ; If not equal
    mov dx, offset msg2
    mov ah, 9
    int 21h
    jmp exit

equal:
    ; If equal
    mov dx, offset msg1
    mov ah, 9
    int 21h

exit:
    mov ah, 4Ch
    int 21h
main endp
end main
