org 100h

Esc equ 1bh
escrever equ 40h
ecran equ  1

mov ah, 4fh
mov al, 02
mov bx, 13h
int 13h

mov [cor], 3
mov [tam], 50
mov [lin], 150
mov [col], 100

lertecla:
mov ah, 07h
int 21h
mov [tecla], al

cmp [tecla], Esc
je terminar

cmp [tecla], 'v'
je retaV

cmp [tecla], 'h'
je retaH



mov ah, escrever
mov bx, ecran
mov cx, 5
mov dx, msgE
int 21h

jmp lertecla


retaV:
mov ah, escrever
mov bx, ecran
mov cx, 8
mov dx, msgV
int 21h
jmp terminar


retaH:
mov ah, escrever
mov bx, ecran
mov cx, 10
mov dx, msgH
int 21h
jmp terminar











terminar:
mov ah, 4ch
int 21h



tecla rb 1
msgV db "vertical"
msgH db "horizontal"
msgE db "Erro",10