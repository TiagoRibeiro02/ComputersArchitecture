; Desenhar pixel
org 100h

terminar equ 4ch
ESC equ 1bh
escrever equ 40h
ecran equ  1

; modo gráfico

mov ah, 4fh
mov al, 02h
mov bx, 10h ; modo gráfico 640 x 350 , 16 cores
int 10h

mov [cor], 3
mov [tam], 50
mov [lin], 150
mov [col], 100

; opções : ESC (27ou1bh) - terminar | 'h' - horizontal  'v' - vertical

lertecla:
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

jmp lertecla

retaH:
mov ah, escrever
mov bx, ecran
mov cx, 6
mov dx, msgH
int 21h

jmp fim

retaV:
call retaVertical


fim:
mov ah, terminar
int 21h



retaVertical:
cicloV:
mov ah, 0ch
mov al, [cor]
mov bh, 0
mov cx, [col] ; coluna
mov dx, [lin] ; linha
int 10h
dec [tam]
jnz cicloV
ret









tecla rb 1; código da tecla lida
msgH db "reta H"
msgV db "reta V"
msgE db "ERRO!"

cor rb 1 ; cor da reta
tam rb 1 ; tam da reta
lin rw 1 ; linha inicial
col rw 1 ; coluna inicial





