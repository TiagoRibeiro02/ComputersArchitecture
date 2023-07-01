; Resolução do problema - jmp fim
org 100h

terminar equ 4ch
ESC equ 1bh
escrever equ 40h
ecran equ  1

; modo gráfico

mov ah, 4fh
mov al, 02h
mov bx, 10h ; modo gráfico 640x 350 , 16 cores
int 10h

; opções : ESC (27ou1bh) - terminar | 'h' - horizontal  'v' - vertical


mov ah, 07h   ;ler tecla
int 21h
mov [tecla], al



cmp [tecla], ESC
je fim

cmp [tecla], 'h'
je retaH

cmp [tecla], 'v'
je retaV


;Mensagem de Erro
mov ah, escrever
mov bx, ecran
mov cx, 5
mov dx, msgE
int 21h

jmp fim

retaH:
mov ah, escrever
mov bx, ecran
mov cx, 6
mov dx, msgH
int 21h

jmp fim

retaV:
mov ah, escrever
mov bx, ecran
mov cx, 6
mov dx, msgV
int 21h








fim:
mov ah, terminar
int 21h





tecla rb 1; código da tecla lida
msgH db "reta H"
msgV db "reta V"
msgE db "ERRO!"


