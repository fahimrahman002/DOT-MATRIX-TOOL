### DOT-MATRIX-TOOL

- **How to use this tool?** - [Tutorial Link](https://youtu.be/zzeJa6gWICo "Video Link")
- **Website Link** - https://fahimrahman002.github.io/DOT-MATRIX-TOOL/
- You can find sample.asm file here -  https://github.com/fahimrahman002/DOT-MATRIX-TOOL/blob/main/sample.asm
- If you want delay then simply call delay function like this -
```
  MOV DX, 2005H
    MOV AL, 1b
    OUT DX, AL

    CALL DELAY
  
    MOV DX, 2005H
    MOV AL, 11b
    OUT DX, AL
```
- To increase the delay time change 1 to 100/any value after CMP AX, 
in sample.asm file like this - 
```
DELAY:
    MOV AX,0
    LOOP1:
 INC AX
 CMP AX,100
 JNE LOOP1
    RET 
```
