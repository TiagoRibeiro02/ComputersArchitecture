org 100h

terminar equ 4ch
fechar   equ 3eh
criar    equ 3ch
escrever equ 40h
abrir    equ 3dh
ler      equ 3fh
ecran    equ 1

;criar ficheiro
mov ah, abrir
mov al, 0
mov dx, path
int 21h
jc erro  ;tratar o erro
mov [handle], ax

ciclo:
;escrever no ficheiro
mov ah, ler
mov bx, [handle]
mov cx, 1
mov dx, msg
int 21h

cmp ax, 0
je sair

;escrever o conteudo do lido
mov ah, escrever
mov bx, ecran
mov cx, 1
mov dx, msg
int 21h

jmp ciclo

;fechar ficheiro
sair:
mov ah, fechar
mov bx, [handle]
int 21h

jmp fim

;tratar erro
erro:
mov ah, escrever
mov bx, ecran
mov cx, 5
mov dx, msgerro
int 21h

;terminar
fim:
mov ah, terminar
int 21h


handle rw 1 ;handle do ficheiro
path db "exemplo.txt",0 ;formato ASCIIZ
msg rb 1
msgerro db "Erro!"