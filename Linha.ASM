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


tamanho rw 1
