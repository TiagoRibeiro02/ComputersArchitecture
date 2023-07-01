

 org 100h
 terminar equ 4ch
 ;seleciona modo de vídeo (função 4FH)
 mov ah, 4FH
 mov al, 02
 mov bx, 13h ;modo gráfico 13H (320 * 200 pixel, 256 cores)
 int 10h ;chamada ao Vídeo
 ;ativa um pixel (função 0CH)

 mov byte[tam], 60 ;tamanho da linha (em pixeis)
 mov cx, 20 ;coluna=50 (entre 0...319 )
 mov dx, 30 ;linha=80 (entre 0...199)
 ciclo_v1:
        mov ah,0ch ;desenha um pixel
        mov al,4 ; vermelho
        mov bh,0
        int 10h
        ;inc cx ;para a linha Horizontal
        inc dx ;para a linha Vertical
        dec byte[tam]
 jnz ciclo_v1
 mov byte[tam], 30 ;tamanho da linha (em pixeis)
 ciclo_h1:
        mov ah,0ch ;desenha um pixel
        mov al,4 ; vermelho
        mov bh,0
        int 10h
        inc cx ;para a linha Horizontal
        dec byte[tam]
 jnz ciclo_h1
 mov byte[tam], 60 ;tamanho da linha (em pixeis)
 ciclo_v2:
        mov ah,0ch ;desenha um pixel
        mov al,4 ; vermelho
        mov bh,0
        int 10h
        dec dx ;para a linha Vertical
        dec byte[tam]
 jnz ciclo_v2
  mov byte[tam], 30 ;tamanho da linha (em pixeis)
 ciclo_h2:
        mov ah,0ch ;desenha um pixel
        mov al,4 ; vermelho
        mov bh,0
        int 10h
        dec cx ;para a linha Horizontal
        dec byte[tam]
 jnz ciclo_h2

 ;tal como no exemplo anterior, neste momento foi desenhado um pixel vermelho
 ;na posição (50,80) do ecran – de seguida vão ser redefinidos os registos RGB da cor 4, fazendo
 ;com que o pixel deixe de ser vermelho e passe a uma cor diferente
 ;redefine registo de cor, ou seja, muda cor do pixel (função 10H)

 mov ah,10H
 mov al,10H
 mov bx,4 ;cor que vai ser redefinida (vermelho)
 mov dh,0 ;novo valor para R
 mov ch,0 ;novo valor para G
 mov cl,60 ;novo valor para B  
 int 10h ;o pixel muda para a nova cor

 ;leitura ‘dummy’ para parar o programa 
 mov ah, 07h
 int 21h ;chamada ao DOS
 ;terminar, retorna ao SistemaOperativo
 mov ah, terminar
 int 21h ;chamada ao DOS

 tam rb 1 ;vai controlar o tamanho da linha
