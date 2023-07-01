org 100h


terminar equ 4ch
fechar equ 3eh
criar equ 3ch


;Criador Ficheiro

mov ah, criar
mov cx, 0
mov dx, path
int 21h
mov [handle], ax  ; Porque que quando se cria um ficheiro esquecese-se o nome e cria-se um número (handle).



; Função Fecho

mov ah, fechar
mov bx, [handle]
int 21h


; terminar

mov ah, terminar
int 21h



handle rw 1 ; Handle do ficheiro
path db "exemplo.txt", 0 ; formato ASCIIZ