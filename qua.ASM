org 100h

;Definir modo gráfico
mov ah, 4fh
mov al, 02h
mov bx, 13h ;Modo Gráfico 320*320 16 cores  ;Caso fossem 10h ficava com uma res melhor!.
int 10h



; Como já estamos em modo gráfico, já podemos descrever a função que desenha um pixel.


mov [cateto1], 60

mov cx, 40
mov dx, 100
ciclo:

mov ah, 0ch ; Funcão que escreve um pixel no ecrã.
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

mov ah, 0ch ; Funcão que escreve um pixel no ecrã.
mov al, 2
mov bh, 0
mov cx, 40
dec dx
int 10h


dec [cateto2]
jnz ciclo1

mov [cateto3], 60

mov cx, 40
mov dx, 100
ciclo2:

mov ah, 0ch ; Funcão que escreve um pixel no ecrã.
mov al, 2
mov bh, 0
inc cx
mov dx, 41
int 10h

dec [cateto3]
jnz ciclo2

mov [cateto4], 60


mov dx, 101

ciclo3:

mov ah, 0ch ; Funcão que escreve um pixel no ecrã.
mov al, 2
mov bh, 0
mov cx, 100
dec dx
int 10h


dec [cateto4]
jnz ciclo3






;Terminar o programa
mov ah, 4ch
int 21h


cateto1  rw 1
cateto2  rw 1
cateto3  rw 1
cateto4  rw 1