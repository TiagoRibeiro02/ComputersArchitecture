org 100h

escrita equ 40h
ecran equ 1

mov cx, 3

ciclo:
push cx

call escrever
;call escrever1

pop cx
loop ciclo

mov ah, 07h
int 21h

mov ah, 4ch
int 21h


escrever:
 mov ah, escrita
 mov bx, ecran
 mov cx, 4
 mov dx, msg
int 21h
ret

escrever1:
 mov ah, escrita
 mov bx, ecran
 mov cx, 10
 mov dx, msg1
int 21h
ret

msg db "UBI", 10
msg1 db "Boa tarde", 10
