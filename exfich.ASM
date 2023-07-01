org 100h

terminar equ 4ch
fechar   equ 3eh
criar    equ 3ch
escrever equ 40h
abrir    equ 3dh
ler      equ 3fh
ecran    equ 1


;abrir ficheiro

mov ah, abrir
mov cx, 0
mov dx, path
int 21h
jc erro
mov [handle], ax

;escrever ficheiro
ciclo:
mov ah, ler
mov cx, 1
mov bx, [handle]
mov dx, msg
int 21h

cmp ax, 0
je sair


;escrever no ecran

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

erro:
mov ah, escrever
mov bx, ecran
mov cx, 5
mov dx, msgerro
int 21h

fim:
mov ah, terminar
int 21h





handle rw 1
path db "ex.txt",0
msg rb 1
msgerro db "Erro!"