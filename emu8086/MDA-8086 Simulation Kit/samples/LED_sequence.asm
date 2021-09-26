TITLE   8086 Code Template (for EXE file)

;       AUTHOR          emu8086
;       DATE            ?
;       VERSION         1.00
;       FILE            ?.ASM

; Note: Set the delay to 100 ms in Emu 8086 and to 10 ms 
;       in I/O Emulation Kit to get best results for this sample
;       (i.e., the delay of I/O Emulation Kit is much smaller than
;        the delay of Emu8086).

; 8086 Code Template

; Directive to make EXE output:
       #MAKE_EXE#

DSEG    SEGMENT 'DATA'

; TODO: add your data here!!!!

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


	MOV DX, 2070h
	MOV AL, 01h

MAINLOOP:

	MOV CX, 7
NEXT:	OUT DX, AL
	ROL Al, 1
	LOOP NEXT
	
	MOV CX, 7
NEXT2:	OUT DX, AL
	ROR Al, 1
	LOOP NEXT2
	
	JMP MAINLOOP
	

; return to operating system:
	RET
START   ENDP

;*******************************************

CSEG    ENDS 

        END    START    ; set entry point.

