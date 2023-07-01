; divisão
; AX dividir (registo 8bit)  AL=quociente     AH=resto
; exemplo: 25 dividir 10
; AX = 25  BL = 10
; div BL ---> AL=2  AH=5


org 100h

escrever equ 40h
ecran equ 1


mov [cont], 15 ; []significa que queremos colocar, neste caso, 20 na variavel

ciclo:         ; label(para onde salta)

mov ah, 0
mov al, [cont]
mov bl, 10
div bl
mov [dezenas], al
mov [unidades], ah

add [dezenas], 48

mov ah, escrever  ;ah = 40h (função de escrita)
mov bx, ecran    ;bx = 1 (1=ecrã)
mov cx, 1    ;cx = 1 (número de caracteres a escrever )
mov dx, dezenas ;dx = endereço da variável "msg" (dx aponta para os dados a escrever)
int 21h      ;provoca a execução da acção (escrita)

add [unidades], 48

mov ah, escrever  ;ah = 40h (função de escrita)
mov bx, ecran    ;bx = 1 (1=ecrã)
mov cx, 1    ;cx = 1 (número de caracteres a escrever )
mov dx, unidades ;dx = endereço da variável "msg" (dx aponta para os dados a escrever)
int 21h      ;provoca a execução da acção (escrita)

mov ah, escrever
mov bx, ecran
mov cx, 1
mov dx, novalinha
int 21h

dec [cont];decrementa, e colocamos [] para decrementar o seu conteudo, neste caso o 2 (cont = cont - 1)
jnz ciclo  ;(j)jump (n)if not (z)zero

mov ah, 4Ch ;ah = 4Ch (função para terminar a execução de um programa)
int 21h     ;provoca a execução da acção (termina o programa)

msg db "Ola mundo", 10 ;define a variável "msg"
novalinha db 10 ;line feed

cont rb 1 ; com um byte pode contar-se de 0...255
dezenas rb 1
unidades rb 1