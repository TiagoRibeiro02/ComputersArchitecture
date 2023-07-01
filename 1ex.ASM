
;Programa que quando pressionado ESC termina o programa, caso outro não termina!
org 100h

terminar equ 4ch
ESC equ 1bh

; modo gráfico

mov ah, 4fh
mov al, 02h
mov bx, 10h ; modo gráfico 640x 350 , 16 cores
int 10h

; opções : ESC (27ou1bh) - terminar | 'h' - horizontal  'v' - vertical

lertecla:
mov ah, 07h   ;ler tecla
int 21h
mov [tecla], al

cmp [tecla], ESC
je fim

jmp lertecla




fim:
mov ah, terminar
int 21h





tecla rb 1; código da tecla lida


