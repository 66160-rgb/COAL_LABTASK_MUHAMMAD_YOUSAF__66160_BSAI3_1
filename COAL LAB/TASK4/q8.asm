include 'emu8086.inc'
.model small
.stack 100h
.data
msg db 'Sum is: $'
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Read 1st digit
    mov ah, 1
    int 21h
    sub al, 48       ; convert ASCII to number
    mov bl, al

    ; Read 2nd digit
    mov ah, 1
    int 21h
    sub al, 48
    add bl, al       ; add 2nd number

    ; Read 3rd digit
    mov ah, 1
    int 21h
    sub al, 48
    add bl, al       ; add 3rd number

    ; Print newline
    mov ah, 2
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h

    ; Print message
    mov dx, offset msg
    mov ah, 9
    int 21h

    ; Convert sum to ASCII and print
    add bl, 48
    mov dl, bl
    mov ah, 2
    int 21h

    ; Exit
    mov ah, 4Ch
    int 21h
main endp
end main
