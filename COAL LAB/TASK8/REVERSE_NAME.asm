org 100h                 ; .COM program start

my_name db 'YOUSAF$'      

start:
    mov si, offset my_name ; load address of name
    mov cx, 0             ; counter = 0

find_len:
    mov al, [si]          ; get current character
    cmp al, '$'           ; end marker?
    je  print_rev
    inc si
    inc cx
    jmp find_len

print_rev:
    dec si                ; point to last character
print_loop:
    mov dl, [si]
    mov ah, 2
    int 21h               ; print DL
    dec si
    dec cx
    jnz print_loop

    mov ah, 4Ch
    mov al, 0
    int 21h               ; exit to DOS