org 100h

terminar equ 4ch
fechar   equ 3eh
criar    equ 3ch
escrever equ 40h

;criar ficheiro
mov ah, criar
mov cx, 0
mov dx, path
int 21h
mov [handle], ax

;escrever no ficheiro
mov ah, escrever
mov bx, [handle]
mov cx, 13
mov dx, msg
int 21h


;fechar ficheiro
mov ah, fechar
mov bx, [handle]
int 21h

;terminar
mov ah, terminar
int 21h


handle rw 1 ;handle do ficheiro
path db "exemplo.txt",0 ;formato ASCIIZ
msg db "Boa tarde UBI"