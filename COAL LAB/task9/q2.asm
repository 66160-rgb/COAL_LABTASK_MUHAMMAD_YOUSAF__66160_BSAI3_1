
.model small
.stack 100h

.data
evenn db "Even Number$"
odd   db "Odd Number$"

.code
main proc
    mov ax, @data        ; load data segment
    mov ds, ax

    mov al, 1            ; number to check (change AL value)
    mov bl, 2            ; divisor

    xor ah, ah           ; clear AH before division (important!)
    div bl               ; AL / BL ? AL = quotient, AH = remainder

    cmp ah, 0            ; remainder 0?
    je evennumber        ; yes ? jump to evennumber

; ---------- PRINT ODD ----------
oddlabel:
    mov dl, 10           ; line feed
    mov ah, 2
    int 21h

    mov dl, 13           ; carriage return
    mov ah, 2
    int 21h

    mov dx, offset odd   ; print "Odd Number"
    mov ah, 9
    int 21h

    mov ah, 4Ch          ; exit program
    int 21h

; ---------- PRINT EVEN ----------
evennumber:
    mov dl, 10           ; line feed
    mov ah, 2
    int 21h

    mov dl, 13           ; carriage return
    mov ah, 2
    int 21h

    mov dx, offset evenn ; print "Even Number"
    mov ah, 9
    int 21h

    mov ah, 4Ch          ; exit program
    int 21h

main endp
end main
