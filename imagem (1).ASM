org 100h

mov ah, 4fh
mov al, 02h
mov bx, 13h
int 10h

mov [tamanho], 50
ciclo:

mov ah, 0ch
mov al, 2
mov bh, 0
mov cx, 120
mov dx, [tamanho]
int 10h

dec [tamanho]
jnz ciclo

mov ah, 10h
mov al, 10h
mov bx, 2
mov dh, 63
mov ch, 63
mov cl, 63
int 10h


mov ah, 4ch
int 21h

tamanho rw 1