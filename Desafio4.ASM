org 100h

escrita equ 40h
ecran equ 1

mov cx, 3

ciclo:
push cx

call escrever


pop cx
loop ciclo


mov ah, escrita
mov bx, ecran
mov cx, 4
mov dx, msglinha
int 21h

mov cx, 5

ciclo1:
push cx

call escrever

pop cx
loop ciclo1


mov ah, 4ch
int 21h


escrever:
 mov ah, escrita
 mov bx, ecran
 mov cx, 4
 mov dx, msg
int 21h
ret






msg db "UBI", 10
msglinha db "---", 10