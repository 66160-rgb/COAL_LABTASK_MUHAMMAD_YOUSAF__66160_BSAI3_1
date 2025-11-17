mov al,13h
mov ah,0
int 10h

mov al,1100b
mov cx,10
mov dx,20
mov ah,0ch
int 10h

mov bl,100
firstline:
int 10h
inc cx
dec bl     
jnz firstline
             
mov bl,100
secondline:
mov al,0001b
int 10h
inc dx
dec bl
jnz secondline               

mov bl,100
thirdline:
mov al,0011b
int 10h
dec cx
dec bl
jnz thirdline

mov bl,100
fourthline:
mov al,1011b
int 10h
dec dx
dec bl
jnz fourthline   










mov al,1100b
mov cx,60
mov dx,70
mov ah,0ch
int 10h

mov bl,100
firstline2:
int 10h
inc cx
dec bl     
jnz firstline2
             
mov bl,100
secondline2:
mov al,0001b
int 10h
inc dx
dec bl
jnz secondline2               

mov bl,100
thirdline2:
mov al,0011b
int 10h
dec cx
dec bl
jnz thirdline2

mov bl,100
fourthline2:
mov al,1011b
int 10h
dec dx
dec bl
jnz fourthline2   







mov cx,10
mov dx,20

mov bl,50
diagonalline1:
int 10h
inc cx
inc dx
dec bl     
jnz diagonalline1  
                     
                     



mov cx,110
mov dx,120


mov bl,50
diagonalline2:
int 10h
inc cx
inc dx
dec bl     
jnz diagonalline2                      
                  
                  
                  

mov cx,110
mov dx,20


mov bl,50
diagonalline3:
int 10h
inc cx
inc dx
dec bl     
jnz diagonalline3






mov cx,10
mov dx,120


mov bl,50
diagonalline4:
int 10h
inc cx
inc dx
dec bl     
jnz diagonalline4                      
                      
                  

