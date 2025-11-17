.model small
.stack 100h

.data
    myname db 'Name: Muhammad Yousaf$'
    sap_id db 'SAP ID : 66160$'
    subject db 'SUBJECT: COAL$'
    newline db 0Dh, 0Ah, '$'

.code     


print_newline proc  
    mov dx, offset newline
    mov ah, 09h
    int 21h
    ret    
print_newline endp 

main proc
    mov ax, @data
    mov ds, ax
    
    ; Print name
    mov dx, offset myname
    mov ah, 09h
    int 21h
    call print_newline
    
    ; Print SAP ID
    mov dx, offset sap_id
    mov ah, 09h
    int 21h
    call print_newline
    
    ; Print subject
    mov dx, offset subject
    mov ah, 09h
    int 21h
    call print_newline
    
    ; Exit program
    mov ah, 4ch
    int 21h
main endp

end main