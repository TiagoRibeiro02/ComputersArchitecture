; CRIAR E ESCREVER NUM FICHEIRO

org 100h


terminar equ 4ch
fechar equ 3eh
criar equ 3ch
escrever equ 40h


;Criador Ficheiro

mov ah, criar
mov cx, 0
mov dx, path
int 21h
mov [handle], ax  ; Porque que quando se cria um ficheiro esquecese-se o nome e cria-se um número (handle).

; Escrever no ficheiro

mov ah, escrever
mov bx, [handle]  ; Não é no ecrã, é no handle
mov cx, 13
mov dx, msg
int 21h


; Função Fecho

mov ah, fechar
mov bx, [handle]
int 21h


; terminar

mov ah, terminar
int 21h



handle rw 1 ; Handle do ficheiro
path db "exemplo1.txt", 0 ; formato ASCIIZ
msg db " Boa tarde UBI"