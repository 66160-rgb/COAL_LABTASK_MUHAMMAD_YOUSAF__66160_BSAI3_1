.model small
.stack 100h

.data
    myname db 'Name: $'
    mysap db 'SAP: $'
    mysubject db 'Subject: $'
    name_input db 50 dup('$')
    sap_input db 50 dup('$')
    subject_input db 50 dup('$')
    newline db 0Dh, 0Ah, '$'

.code
print_newline proc
    mov dx, offset newline
    mov ah, 09h
    int 21h
    ret
print_newline endp

get_input proc
input_loop:
    mov ah, 01h
    int 21h
    cmp al, 0Dh
    je input_done
    mov [di], al
    inc di
    jmp input_loop
input_done:
    mov byte ptr [di], '$'
    call print_newline
    ret
get_input endp

main proc
    mov ax, @data
    mov ds, ax
    
    ; Name input
    mov dx, offset myname
    mov ah, 09h
    int 21h
    mov di, offset name_input
    call get_input
    
    ; SAP input
    mov dx, offset mysap
    mov ah, 09h
    int 21h
    mov di, offset sap_input
    call get_input
    
    ; Subject input
    mov dx, offset mysubject
    mov ah, 09h
    int 21h
    mov di, offset subject_input
    call get_input
    
    call print_newline
    
    ; Display all
    ; Display Name
    mov dx, offset myname
    mov ah, 09h
    int 21h
    mov dx, offset name_input
    int 21h
    call print_newline
    
    ; Display SAP
    mov dx, offset mysap
    mov ah, 09h
    int 21h
    mov dx, offset sap_input
    int 21h
    call print_newline
    
    ; Display Subject
    mov dx, offset mysubject
    mov ah, 09h
    int 21h
    mov dx, offset subject_input
    int 21h
    call print_newline
    
    mov ah, 4ch
    int 21h
main endp
end main