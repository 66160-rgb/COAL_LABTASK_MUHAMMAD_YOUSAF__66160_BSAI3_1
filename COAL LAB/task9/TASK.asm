.model small
.stack 100h

.data
numbers      db '0123456789$'                     ; Array for numbers
specials     db '!@#$%^&*()_+-={}[]:;"''<>,.?/|\$' ; Array for special characters

msgNum       db 10,13,'You entered a NUMBER.$'
msgAlpha     db 10,13,'You entered an ALPHABET.$'
msgSpecial   db 10,13,'You entered a SPECIAL CHARACTER.$'

.code
main proc
    mov ax,@data
    mov ds,ax

    ; Read a single character from keyboard
    mov ah,1
    int 21h
    mov bl,al                 
    lea si, numbers            ; point to number array
check_num:
    lodsb                      ; load next character from array -> AL
    cmp al, '$'                ; end of string?
    je check_alpha             ; if $, end of array
    cmp bl, al                 ; compare input with number char
    je is_number               ; if match -> number
    jmp check_num              ; otherwise keep checking

   
check_alpha:
    mov al, bl
    cmp al, 'A'
    jl check_special            ; if below 'A' ? not alphabet
    cmp al, 'Z'
    jle is_alpha                ; uppercase alphabet
    cmp al, 'a'
    jl check_special            ; between 'Z' and 'a'
    cmp al, 'z'
    jle is_alpha                ; lowercase alphabet

    
    ; 3. Check if it's Special Character
    
check_special:
    lea si, specials
check_special_loop:
    lodsb
    cmp al, '$'
    je unknown
    cmp bl, al
    je is_special
    jmp check_special_loop

    
    ; If not found anywhere (fallback)
    
unknown:
    mov dx, offset msgSpecial   ; treat as special by default
    mov ah,9
    int 21h
    jmp exitProg

   
    ; Display messages
    
is_number:
    mov dx, offset msgNum
    mov ah,9
    int 21h
    jmp exitProg

is_alpha:
    mov dx, offset msgAlpha
    mov ah,9
    int 21h
    jmp exitProg

is_special:
    mov dx, offset msgSpecial
    mov ah,9
    int 21h

exitProg:
    mov ah,4Ch
    int 21h
main endp
end main
