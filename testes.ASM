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

jc erro ; Tratar o erro
mov [handle], ax  ; Porque que quando se cria um ficheiro esquecese-se o nome e cria-se um n�mero (handle).

lertecla:
mov ah, 07h
int 21h


ciclo:
; Ler no ficheiro      ; SAIDA : AX = n�mero de bytes lidos

mov ah, ler
mov bx, [handle]  ; N�o � no ecr�, � no handle
mov cx, 1
mov dx, msg
int 21h

cmp ax, 0
je sair


cmp [msg], 20h
je espaco

mov al, [tecla]
cmp al, [msg]

jg maior


jng menorig


maior:

inc [amaio]


jmp ciclo


menorig:

inc [menig]

jmp ciclo


espaco:

jmp ciclo




; Fun��o Fecho
sair:
mov ah, fechar
mov bx, [handle]
int 21h


;mensagem com os maiores
mov ah, escrever  ;ah = 40h (fun��o de escrita)
mov bx, 1    ;bx = 1 (1=ecr�)
mov cx, 7    ;cx = 1 (n�mero de caracteres a escrever )
mov dx, msgmaior ;dx = endere�o da vari�vel "msg" (dx aponta para os dados a escrever)
int 21h


add [amaio], 48

mov ah, escrever  ;ah = 40h (fun��o de escrita)
mov bx, 1    ;bx = 1 (1=ecr�)
mov cx, 1    ;cx = 1 (n�mero de caracteres a escrever )
mov dx, amaio ;dx = endere�o da vari�vel "msg" (dx aponta para os dados a escrever)
int 21h

;mensagem com o espaco
mov ah, escrever  ;ah = 40h (fun��o de escrita)
mov bx, 1    ;bx = 1 (1=ecr�)
mov cx, 2    ;cx = 1 (n�mero de caracteres a escrever )
mov dx, msgespaco ;dx = endere�o da vari�vel "msg" (dx aponta para os dados a escrever)
int 21h

;mensagem com os meores

mov ah, escrever  ;ah = 40h (fun��o de escrita)
mov bx, 1    ;bx = 1 (1=ecr�)
mov cx, 16    ;cx = 1 (n�mero de caracteres a escrever )
mov dx, msgmenor ;dx = endere�o da vari�vel "msg" (dx aponta para os dados a escrever)
int 21h

add [menig], 48

mov ah, escrever  ;ah = 40h (fun��o de escrita)
mov bx, 1    ;bx = 1 (1=ecr�)
mov cx, 1    ;cx = 1 (n�mero de caracteres a escrever )
mov dx, menig ;dx = endere�o da vari�vel "msg" (dx aponta para os dados a escrever)
int 21h
jmp fim





; Tratar erro

erro:
mov ah, escrever
mov bx, 1
mov cx, 28
mov dx, msgerr
int 21h

; terminar
fim:
mov ah, terminar
int 21h


comparador rb 1
menig rb 1
amaio rb 1
tecla rb 1
handle rw 1 ; Handle do ficheiro
path db "algarismos.txt", 0 ; formato ASCIIZ
msg rb 1
msgerr db  "Erro na abertura do ficheiro"
msgmaior db "maior: "
msgmenor db "menor ou igual: "
msgespaco db  "  "

