.model small           ; small memory model
.stack 100h            ; define stack space
.data                  ; data segment (not used)
.code                  ; start of code segment

start:                 ; program entry point

    ; Display 'Y'
    mov ah, 2          ; DOS function to print character
    mov dl, 'Y'        ; load 'Y' into DL
    int 21h            ; interrupt to print

    ; Display 'O'
    mov ah, 2
    mov dl, 'O'
    int 21h

    ; Display 'U'
    mov ah, 2
    mov dl, 'U'
    int 21h

    ; Display 'S'
    mov ah, 2
    mov dl, 'S'
    int 21h

    ; Display 'A'
    mov ah, 2
    mov dl, 'A'
    int 21h

    ; Display 'F'
    mov ah, 2
    mov dl, 'F'
    int 21h

    ; End program
    mov ah, 4Ch        ; function to terminate program
    int 21h

end start
