;pede numero de 0 a 99
;calcula o quadrado do mesmo
;desafio fazer ate 99 x 99

org 100h

ler      equ 3fh
teclado  equ 0
escrever equ 40h
ecran    equ 1
terminar equ 4ch

;escrita menssagem a pedir valor
mov ah, escrever
mov bx, ecran
mov cx, 36
mov dx, msg
int 21h



;ler valor do teclado
mov ah, ler
mov bx, teclado
mov cx, 2
mov dx, valor
int 21h

;ler LF+CR
mov ah, ler
mov bx, teclado
mov cx, 2
mov dx, tmp
int 21h







mov ax, [valor]
mov bl, 10
div bl
mov [dezprincip], al
mov [unprincip], ah


mov al, [dezprincip]
mul al
mov [quadrado], ax

mov ax, [quadrado]
mov bl, 10
div bl
mov [dezenas1], al
mov [unidades1], ah




mov ax, [dezenas1]
mov bl, 10
div bl
mov [dezenas4], al
mov [unidades4], ah


mov al, [unprincip]
mul al
mov [quadrado], ax

mov ax, [quadrado]
mov bl, 10
div bl
mov [dezenas2], al
mov [unidades2], ah




add [unidades1], [dezenas2]

mov ax, [unidades1]
mov bl, 10
div bl
mov [dezenas3], al
mov [unidades3], ah



add [unidades2], [unidades3]

add [dezenas3], [unidades4]



;escrita menssagem do resultado
mov ah, escrever
mov bx, ecran
mov cx, 14
mov dx, msg2
int 21h

add [dezenas4], 48

mov ah, escrever
mov bx, ecran
mov cx, 1
mov dx, dezenas1
int 21h

add [dezenas3], 48

;escrita no ecrã
mov ah, escrever
mov bx, ecran
mov cx, 1
mov dx, dezenas3
int 21h


add [unidades2], 48

;escrita no ecrã
mov ah, escrever
mov bx, ecran
mov cx, 1
mov dx, unidades2
int 21h



;terminar
mov ah, terminar
int 21h









valor    rb 2     ;variável de leitura
tmp      rb 2     ; variavel temporaria
quadrado rw 1     ;variavel que contem o quadrado
dezenas1  rb 1
dezenas2  rb 1
dezenas3  rb 1
dezenas4  rb 1
unidades1 rb 1
unidades2 rb 1
unidades3 rb 1
unidades4 rb 1
unprincip rb 1
dezprincip rb 1

msg db "Coloque aqui um numero entre 0 e 99",10    ;35 carcteres
msg2 db "O quadrado e: " ;14 caracteres