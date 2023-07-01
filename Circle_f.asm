; ---------------------------------------------------------------------------
; -      TITULO  : Circunferencia Bresenham COM-MASM                        -
; -----                                                                 -----
; -      AUTOR   : Alfonso Víctor Caballero Hurtado                         -
; -----                                                                 -----
; -      VERSION : 1.0                                                      -
; -                http://www.abreojosensamblador.net/. Released to public  -
; -                domain. Please, credit me if you use this code           -
; ---------------------------------------------------------------------------

__ClipX1 EQU 0
__ClipY1 EQU 20
__ClipX2 EQU 210
__ClipY2 EQU 180
__VgaSeg EQU 0A000h

Macro SetMode Modo
{
  ; Propósito : Establecer el módo gráfico/texto
  ; Entrada   : Ninguna
  ; Salida    : Salida
  ; Destruye  : AX
  ; Coment    : 13h: 320x200x256, 3h: modo texto 80x25x16
  MOV	  AH, 0h
  MOV	  AL, Modo			; Modo 13h, 320x200x256
  INT	  10h				; Lo hacemos
}

use16					; usa codigo de 16 bits
ORG	 100h				; ES tipo COM
CALL	 VGAColor		      ; Comprobamos si existe VGA en color
SetMode  13h			      ; Ponemos el modo gráfico
PUSH	 ES			      ; Guardamos ES
MOV	 AX, __VgaSeg
MOV	 ES, AX
CALL	 Prueba
POP	 ES			      ; Recuperamos ES
SetMode  3h			      ; Volvemos al modo texto
; Salimos al DOS
MOV	 AX, 4C00h		      ; Servicio 4Ch, mensaje 0
INT	 21h			      ; volvemos AL DOS

VGAColor:
  ; Propósito: Comprueba si hay un monitor VGA en color
  ; Entrada  : Ninguna
  ; Salida   : Mensaje de error si no existe y salida al DOS
  ; Destruye : AX, DX
  MOV	  AX, 1A00h
  INT	  10H				; Check for VGA
  CMP	  AL, 7
  JG	  VGAFound
  Monocromo:
    MOV     DX, VGAColor_Mensaje
    MOV     AH, 9
    INT     21h
    MOV     AX, 4C04h
    INT     21H
  VGAFound:
  CMP	  AL, 0Bh
  JZ	  Monocromo
RET
  VGAColor_Mensaje  DB "Tarjeta no VGA o no color$"

ClipPixel:
  ; Propósito: Dibujamos un punto con recorte en (BX,DX) en modo 13h
  ; Entrada  : BX, eje X; DX, eje Y; AL, color
  ; Salida   : BX: dirección en el búfer de pantalla del punto
  ; Destruye : Ninguna
  PUSH	   BX
  CMP	   BX, __ClipX1
  JBE	   ._FinCP
  CMP	   BX, __ClipX2
  JNB	   ._FinCP
  CMP	   DX, __ClipY1
  JBE	   ._FinCP
  CMP	   DX, __ClipY2
  JNB	   ._FinCP
  PUSH	   DX
  XCHG	   DL, DH		      ; DX = 256y
  ADD	   BX, DX		      ; BX = 256y + x
  SHR	   DX, 1
  SHR	   DX, 1		      ; DX = 64y
  ADD	   BX, DX		      ; BX = 320y + x
  MOV	   [ES:BX], AL
  POP	   DX
  ._FinCP:
  POP	   BX
RET

PintaOctantes:
  ;  Propósito: Dibujamos para cada punto calculado su imagen en cada octante
  ;  Entrada  : BP: puntero a los valores necesarios
  ;  Salida   : Ninguna
  ;  Destruye : AX, BX, DX
  MOV	   AX, WORD [BP+4]	    ; Color
  ; Primer octante
  MOV	   BX, WORD [BP+10]	    ; CentX
  ADD	   BX, WORD [BP-2]	    ; miX
  MOV	   DX, WORD [BP+8]	    ; CentY
  SUB	   DX, WORD [BP-4]	    ; miY
  CALL	   ClipPixel
  ; Segundo octante
  MOV	   BX, WORD [BP+10]	    ; CentX
  ADD	   BX, WORD [BP-4]	    ; miY
  MOV	   DX, WORD [BP+8]	    ; CentY
  SUB	   DX, WORD [BP-2]	    ; miX
  CALL	   ClipPixel
  ; Tercer octante
  MOV	   BX, WORD [BP+10]	    ; CentX
  SUB	   BX, WORD [BP-4]	    ; miY
  MOV	   DX, WORD [BP+8]	    ; CentY
  SUB	   DX, WORD [BP-2]	    ; miX
  CALL	   ClipPixel
  ; Cuarto octante
  MOV	   BX, WORD [BP+10]	    ; CentX
  SUB	   BX, WORD [BP-2]	    ; miX
  MOV	   DX, WORD [BP+8]	    ; CentY
  SUB	   DX, WORD [BP-4]	    ; miY
  CALL	   ClipPixel
  ; Quinto octante
  MOV	   BX, WORD [BP+10]	    ; CentX
  SUB	   BX, WORD [BP-2]	    ; miX
  MOV	   DX, WORD [BP+8]	    ; CentY
  ADD	   DX, WORD [BP-4]	    ; miY
  CALL	   ClipPixel
  ; Sexto octante
  MOV	   BX, WORD [BP+10]	    ; CentX
  SUB	   BX, WORD [BP-4]	    ; miY
  MOV	   DX, WORD [BP+8]	    ; CentY
  ADD	   DX, WORD [BP-2]	    ; miX
  CALL	   ClipPixel
  ; Séptimo octante
  MOV	   BX, WORD [BP+10]	    ; CentX
  ADD	   BX, WORD [BP-4]	    ; miY
  MOV	   DX, WORD [BP+8]	    ; CentY
  ADD	   DX, WORD [BP-2]	    ; miX
  CALL	   ClipPixel
  ; Octavo octante
  MOV	   BX, WORD [BP+10]	    ; CentX
  ADD	   BX, WORD [BP-2]	    ; miX
  MOV	   DX, WORD [BP+8]	    ; CentY
  ADD	   DX, WORD [BP-4]	    ; miY
  CALL	   ClipPixel
RET

BCircle:
  ;  Propósito: Dibujamos una circunferencia con algoritmo de Bresenham
  ;  Entrada  : (CentX, CentY, Radio, Color) todos son word en la pila
  ;  Salida   : Ninguna
  ;  Destruye : Ninguna
  ;  Color=BP+4, Radio=BP+6, CentY=BP+8, CentX=BP+10
  ;  miX=BP-2, miY=BP-4
  PUSH	   BP
  MOV	   BP, SP
  SUB	   SP, 2*2			; 2 variables internas
  ; Guardamos registros
  PUSH	   AX
  PUSH	   BX
  PUSH	   CX
  PUSH	   DX
  PUSH	   SI
  PUSH	   DI
  ; Aquí empieza el código
  ; 0) Inicializamos
  MOV	   WORD [BP-4], 0		; miY = 0
  MOV	   AX, WORD [BP+6]		; Radio
  MOV	   WORD [BP-2], AX		; miX = R
  SHL	   AX, 1
  DEC	   AX
  NEG	   AX
  MOV	   SI, AX			; XChange
  MOV	   DI, 1			; YChange
  MOV	   CX, 0			; miRE
  ; 1) Bucle principal
  ._Main_Loop:
    MOV      AX, WORD [BP-2]		; miX
    CMP      AX, WORD [BP-4]		; miY
    JL	     ._Fuera
    CALL     PintaOctantes
    ; AX = 2(RE+YChange)+XChange
    MOV      AX, CX			; miRE
    ADD      AX, DI			; YChange
    SHL      AX, 1
    ADD      AX, SI			; XChange
    ;
    INC      WORD [BP-4]		; miY+=1
    ADD      CX, DI			; miRE+=YChange
    ADD      DI, 2			; YChange+=2
    CMP      AX, 0
    JLE      ._Sgte1
      DEC      WORD [BP-2]		; miX
      ADD      CX, SI			; miRE+XChange
      ADD      SI, 2			; XChange
    ._Sgte1:
  JMP	   ._Main_Loop
  ._Fuera:
  ; Aquí termina el código
  ; Recuperamos los registros
  POP	   DI
  POP	   SI
  POP	   DX
  POP	   CX
  POP	   BX
  POP	   AX
  ; Eliminamos variables locales y restauramos BP
  MOV	   SP, BP
  POP	   BP
RET	 2*4

  Prueba:
    MOV      AX, 60			  ; CentX
    PUSH     AX
    MOV      AX, 80			  ; CentY
    PUSH     AX
    MOV      AX, 50			  ; Radio
    PUSH     AX
    MOV      AX, 7			  ; Color
    PUSH     AX
    CALL     BCircle
    XOR      AH, AH
    INT      16h
  RET
