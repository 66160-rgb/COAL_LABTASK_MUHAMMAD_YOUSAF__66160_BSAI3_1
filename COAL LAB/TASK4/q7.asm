include 'emu8086.inc'
.model small
.stack 100h
.data
msg db 'Sum is: $'
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Read first digit
    mov ah, 1
    int 21h
    sub al, 48      ; convert ASCII to number
    mov bl, al

    ; Read second digit
    mov ah, 1
    int 21h
    sub al, 48
    add bl, al

    ; Read third digit
    mov ah, 1
    int 21h
    sub al, 48
    add bl, al

    ; Convert sum back to ASCII
    add bl, 48

    ; Print newline
    mov ah, 2
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h

    ; Print "Sum is: "
    mov dx, offset msg
    mov ah, 9
    int 21h

    ; Print result
    mov ah, 2
    mov dl, bl
    int 21h

    ; Exit
    mov ah, 4Ch
    int 21h
main endp
end main
