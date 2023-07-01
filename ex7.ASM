; Desenhar reta HV
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



;cmp [tecla], ESC
;je fim

;cmp [tecla], 'h'
;je retaH

;cmp [tecla], 'v'
;je retaV

call retaHV
jmp fim


;Mensagem de Erro
mov ah, escrever
mov bx, ecran
mov cx, 5
mov dx, msgE
int 21h

jmp lertecla

retaH:
call retaHorizontal

jmp fim

retaV:
call retaVertical



fim:
mov ah, terminar
int 21h

pixel:
mov ah, 0ch
mov al, [cor]
mov bh, 0
int 10h
ret


retaVertical:
mov cx, [col]
mov dx, [lin]
cicloV:
call pixel
inc dx
dec [tam]
jnz cicloV
ret


retaHorizontal:
mov cx, [col]
mov dx, [lin]
cicloH:
call pixel
inc cx
dec [tam]
jnz cicloH
ret

retaHV:
mov cx, [col]
mov dx, [lin]
cicloHV:
call pixel
cmp [tecla], 'h'
je incol
cmp [tecla], 'v'
je inlin

incol:
inc cx
jmp segue

inlin:
inc dx

segue:
dec [tam]
jnz cicloHV
ret





tecla rb 1; código da tecla lida
msgH db "reta H"
msgV db "reta V"
msgE db "ERRO!"

cor rb 1 ; cor da reta
tam rb 1 ; tam da reta
lin rw 1 ; linha inicial
col rw 1 ; coluna inicial

