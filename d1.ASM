;Desafio 1a

org 100h

;Definir modo gr�fico
mov ah, 4fh
mov al, 02h
mov bx, 13h ;Modo Gr�fico 320*320 16 cores  ;Caso fossem 10h ficava com uma res melhor!.
int 10h



; Como j� estamos em modo gr�fico, j� podemos descrever a fun��o que desenha um pixel.


mov [tamanho], 150

mov cx, 40
mov dx, 100
ciclo:

mov ah, 0ch ; Func�o que escreve um pixel no ecr�.
mov al, 2
mov bh, 0
inc cx
mov dx, 100
int 10h

dec [tamanho]
jnz ciclo




;Terminar o programa
mov ah, 4ch
int 21h


tamanho rw 1 ; tamanho da reta, como queremos uma reta que n�o ocupeo tamanho da tela gr�fica, por isso 1 bite chega
             ; rb - reserve byte 8 bit rw - reserve word 16 bit



; Desafios :
; - Fazer linhas que comecem sem ser no 0 ou seja, na extremidade da imagem.
; - Fazer figuras geom�tricas como por exemplo, quadrados, ret�ngulos...
; - Fazer uma circunfer�ncia.
