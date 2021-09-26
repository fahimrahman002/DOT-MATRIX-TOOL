DSEG    SEGMENT 'DATA' 
    
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

; Copy your code here-






; return to operating system:
    RET
  
START   ENDP
       
DELAY:
    MOV AX,0
    LOOP1:
	INC AX
	CMP AX,1
	JNE LOOP1

    RET

;*******************************************

CSEG    ENDS 

        END    START    ; set entry point