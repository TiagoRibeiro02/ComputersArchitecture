org 100h

 mov ah, 40h ;ah = 40h (fun��o de escrita)
 mov bx, 1   ;bx = 1 (1=ecr�)
 mov cx, 10   ;cx = 9 (n�mero de caracteres a escrever )
 mov dx, msg ;dx = endere�o da vari�vel "msg" (dx aponta para os dados a escrever)
 int 21h     ;provoca a execu��o da ac��o (escr

 mov ah, 40h ;ah = 40h (fun��o de escrita)
 mov bx, 1   ;bx = 1 (1=ecr�)
 mov cx, 9   ;cx = 9 (n�mero de caracteres a escrever )
 mov dx, msg ;dx = endere�o da vari�vel "msg" (dx aponta para os dados a escrever)
 int 21h     ;provoca a execu��o da ac��o (escrita)

 mov ah, 4Ch ;ah = 4Ch (fun��o para terminar a execu��o de um programa)
 int 21h     ;provoca a execu��o da ac��o (termina o programa)

 msg db "Ola mundo", 10 ;define a vari�vel "msg"
