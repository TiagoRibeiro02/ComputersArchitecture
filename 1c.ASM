; LEITOR DE FICHEIROS

org 100h


terminar equ 4ch
fechar equ 3eh
criar equ 3ch
escrever equ 40h
abrir equ  3dh
ler equ 3fh



;Abrir Ficheiro

mov ah, abrir
mov al, 0 ; Abrir s� para leitura
mov dx, path
int 21h
mov [handle], ax  ; Porque que quando se cria um ficheiro esquecese-se o nome e cria-se um n�mero (handle).

; Ler no ficheiro      ; SAIDA : AX = n�mero de bytes lidos

mov ah, ler
mov bx, [handle]  ; N�o � no ecr�, � no handle
mov cx, 14
mov dx, msg
int 21h


; Fun��o Fecho

mov ah, fechar
mov bx, [handle]
int 21h

; Escrever o conte�do do ficheiro

mov ah, escrever
mov bx, 1
mov cx, 14
mov dx, msg
int 21h


; terminar

mov ah, terminar
int 21h



handle rw 1 ; Handle do ficheiro
path db "exemplo1.txt", 0 ; formato ASCIIZ
msg rb 14

