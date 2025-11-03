include 'emu8086.inc'
.model small
.stack 100h
.data
.code

main proc
    mov dl, 5
    mov bl, 5
    cmp dl, bl
    je equal

    print 'Both are not equal'
    jmp exit

equal:
    print 'Both are equal'

exit:
    mov ah, 4Ch
    int 21h
main endp
end main
