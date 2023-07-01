;Desafio 1a

org 100h

;Definir modo gráfico
mov ah, 4fh
mov al, 02h
mov bx, 13h ;Modo Gráfico 320*320 16 cores  ;Caso fossem 10h ficava com uma res melhor!.
int 10h



; Como já estamos em modo gráfico, já podemos descrever a função que desenha um pixel.


mov [tamanho], 150

mov cx, 40
mov dx, 100
ciclo:

mov ah, 0ch ; Funcão que escreve um pixel no ecrã.
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


tamanho rw 1
