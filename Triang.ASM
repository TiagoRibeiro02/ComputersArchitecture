;Desafio 1a

org 100h

;Definir modo gr�fico
mov ah, 4fh
mov al, 02h
mov bx, 13h ;Modo Gr�fico 320*320 16 cores  ;Caso fossem 10h ficava com uma res melhor!.
int 10h



; Como j� estamos em modo gr�fico, j� podemos descrever a fun��o que desenha um pixel.


mov [cateto1], 60

mov cx, 40
mov dx, 100
ciclo:

mov ah, 0ch ; Func�o que escreve um pixel no ecr�.
mov al, 2
mov bh, 0
inc cx
mov dx, 100
int 10h

dec [cateto1]
jnz ciclo



mov [cateto2], 60

mov cx, 40
mov dx, 101

ciclo1:

mov ah, 0ch ; Func�o que escreve um pixel no ecr�.
mov al, 2
mov bh, 0
mov cx, 40
dec dx
int 10h


dec [cateto2]
jnz ciclo1



mov [hipot], 60

mov cx, 40
mov dx, 40

ciclo2:

mov ah, 0ch ; Func�o que escreve um pixel no ecr�.
mov al, 2
mov bh, 0
inc cx
inc dx
int 10h


dec [hipot]
jnz ciclo2



;Terminar o programa
mov ah, 4ch
int 21h


cateto1  rw 1
cateto2  rw 1
hipot    rw 1
