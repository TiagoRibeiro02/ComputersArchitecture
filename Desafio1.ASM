org 100h

mov [cont], 5 ; []significa que queremos colocar, neste caso, 20 na variavel

ciclo:

mov ah, 40h ;ah = 40h (função de escrita)
mov bx, 1   ;bx = 1 (1=ecrã)
mov cx, 10   ;cx = 10 (número de caracteres a escrever )
mov dx, msg ;dx = endereço da variável "msg" (dx aponta para os dados a escrever)
int 21h     ;provoca a execução da acção (escrita)

;mov ah, 40h
;mov bx, 1
;mov cx, 1
;mov dx, novalinha
;int 21h

dec [cont] ;decrementa, e colocamos [] para decrementar o seu conteudo, neste caso o 2 (cont = cont - 1)
jnz ciclo  ;(j)jump (n)if not (z)zero

mov ah, 4Ch ;ah = 4Ch (função para terminar a execução de um programa)
int 21h     ;provoca a execução da acção (termina o programa)

msg db "Ola mundo", 10 ;define a variável "msg"
;novalinha db 10 ;line feed

cont rb 1 ; com um byte pode contar-se de 0...255