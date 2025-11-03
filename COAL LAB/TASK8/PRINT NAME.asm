org 100h                 ; Tell assembler this is a .COM program starting at memory offset 100h

; Print name only
mov dx, offset myname    ; DX register = memory address where 'myname' string is stored
mov ah, 09h              ; AH register = 09h (DOS function to print string)
int 21h                  ; Call DOS interrupt to execute the print string function

; Exit to DOS
mov ah, 4Ch              ; AH register = 4Ch (DOS function to terminate program)
mov al, 0                 ; AL register = 0 (Exit code - 0 means success)
int 21h                  ; Call DOS interrupt to exit program and return to DOS

; Data section
myname db 'YOUSAF$'       ; Define byte: Create string 'YOUSAF' ending with '$' (DOS string terminator)