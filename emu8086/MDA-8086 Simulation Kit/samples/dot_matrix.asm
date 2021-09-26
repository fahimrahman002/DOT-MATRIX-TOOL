TITLE   8086 Code Template (for EXE file)

;       AUTHOR          emu8086
;       DATE            ?
;       VERSION         1.00
;       FILE            ?.ASM

; 8086 Code Template

; Directive to make EXE output:
       #MAKE_EXE#

DSEG    SEGMENT 'DATA'

Dots	DB	01111110b, 00010001b, 00010001b, 00010001b, 01111110b  ; A
	DB	01111111b, 01001001b, 01001001b, 01001001b, 00110110b  ; B
	DB	00111110b, 01000001b, 01000001b, 01000001b, 00100010b  ; C
	DB	01111111b, 01000001b, 01000001b, 00100010b, 00011100b  ; D
	DB	01111111b, 01001001b, 01001001b, 01001001b, 01000001b  ; E
	DB	01111111b, 00001001b, 00001001b, 00001001b, 00000001b  ; F
	DB	00111110b, 01000001b, 01001001b, 01001001b, 01111010b  ; G
	DB	01111111b, 00001000b, 00001000b, 00001000b, 01111111b  ; H

DSEG    ENDS

SSEG    SEGMENT STACK   'STACK'
        DW      100h    DUP(?)
SSEG    ENDS

CSEG    SEGMENT 'CODE'

;*******************************************

START   PROC    FAR

; Store return address to OS:
    PUSH    DS
    MOV     AX, 0
    PUSH    AX

; set segment registers:
	MOV     AX, DSEG
    	MOV     DS, AX
    	MOV     ES, AX


	MOV DX,2000h	; first DOT MATRIX digit
	MOV BX, 0

MAINLOOP:
	MOV SI, 0
	MOV CX, 5

NEXT:
	MOV AL,Dots[BX][SI]
	out dx,al
	INC SI
	INC DX

	CMP SI, 5
	LOOPNE NEXT

	ADD BX, 5
	CMP BX, 40
	JL MAINLOOP

; return to operating system:
    RET
START   ENDP

;*******************************************

CSEG    ENDS 

        END    START    ; set entry point.

