org 100h

.data
small_letter db 'a'        ; Small letter to convert

.code
mov ax, @data
mov ds, ax


; Print space
mov dl, ' '
mov ah, 02h
int 21h

; Convert small to capital using OR
mov bl, small_letter       ; Load small letter
and bl, 11011111b          ; OR equivalent: Clear the 5th bit (AND with 11011111b)

; Print converted capital letter
mov dl, bl
mov ah, 02h
int 21h

; Exit to DOS
mov ah, 4Ch
mov al, 0
int 21h