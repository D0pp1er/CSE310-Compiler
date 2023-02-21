.MODEL SMALL
.STACK 1000H
.Data
	CR EQU 0DH
	LF EQU 0AH
	number DB "00000$"
		;global variables are declared here
.CODE
		; FUNCTIONS ARE DEFINED HERE
main PROC 
	MOV AX, @DATA
	MOV DS, AX
		; pushing bp
	PUSH BP
	MOV BP , SP
		;Line no 30
		;variable declaration
	SUB SP, 2
	SUB SP, 2
	SUB SP, 2
		; Line no 31
	MOV AX, 1
	PUSH AX
	POP AX
	MOV [BP-6] , AX
	PUSH AX
	POP AX
		; Line no 32
	MOV AX, 2
	PUSH AX
	POP AX
	MOV [BP-4] , AX
	PUSH AX
	POP AX
		; Line no 33
	MOV AX, [BP-4]
	PUSH AX
	MOV AX, [BP-6]
	PUSH AX
	CALL g
	PUSH AX
	POP AX
	MOV [BP-6] , AX
	PUSH AX
	POP AX
		;Line no 34
		;calling println
	MOV AX, [BP-6]
	CALL print_output
	CALL new_line
		;Line no 35
		;for loop initialize
	MOV AX, 0
	PUSH AX
	POP AX
	MOV [BP-2] , AX
	PUSH AX
	POP AX
L2:		;loop starts here
	MOV AX, [BP-2]
	PUSH AX
	MOV AX, 4
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JL L5
	JMP L4
L5:
	MOV AX, 1
	PUSH AX
	JMP L6
L4:
	MOV AX, 0
	PUSH AX
L6:
	POP AX
	CMP AX, 0
	JE L3
		; Line no 36
	MOV AX, 3
	PUSH AX
	POP AX
	MOV [BP-6] , AX
	PUSH AX
	POP AX
		;Line no 37
L7:		;while loop initialize
	MOV AX, [BP-6]
	PUSH AX
	MOV AX, 0
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JG L10
	JMP L9
L10:
	MOV AX, 1
	PUSH AX
	JMP L11
L9:
	MOV AX, 0
	PUSH AX
L11:
	POP AX
	CMP AX, 0
	JE L8
		; Line no 38
	MOV AX, [BP-4]
	PUSH AX
	INC AX
	MOV [BP-4] , AX
	POP AX
		; Line no 39
	MOV AX, [BP-6]
	PUSH AX
	DEC AX
	MOV [BP-6] , AX
	POP AX
	JMP L7
L8:
	MOV AX, [BP-2]
	PUSH AX
	INC AX
	MOV [BP-2] , AX
	POP AX
	JMP L2
L3:
		;Line no 42
		;calling println
	MOV AX, [BP-6]
	CALL print_output
	CALL new_line
		;Line no 43
		;calling println
	MOV AX, [BP-4]
	CALL print_output
	CALL new_line
		;Line no 44
		;calling println
	MOV AX, [BP-2]
	CALL print_output
	CALL new_line
		;Line no 45
	MOV AX, 0
	PUSH AX
	POP AX
	JMP L1
L1:		;returning from a function
	MOV SP, BP
	POP BP
	MOV AX,4CH
	INT 21H
main ENDP
		; FUNCTIONS ARE DEFINED HERE
g PROC 
		; pushing bp
	PUSH BP
	MOV BP , SP
		;Line no 14
		;variable declaration
	SUB SP, 2
	SUB SP, 2
		; Line no 15
	MOV AX, [BP+4]
	PUSH AX
	CALL f
	PUSH AX
	MOV AX, [BP+4]
	PUSH AX
	POP DX
	POP AX
	ADD AX, DX
	PUSH AX
	MOV AX, [BP+6]
	PUSH AX
	POP DX
	POP AX
	ADD AX, DX
	PUSH AX
	POP AX
	MOV [BP-4] , AX
	PUSH AX
	POP AX
		;Line no 17
		;for loop initialize
	MOV AX, 0
	PUSH AX
	POP AX
	MOV [BP-2] , AX
	PUSH AX
	POP AX
L13:		;loop starts here
	MOV AX, [BP-2]
	PUSH AX
	MOV AX, 7
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JL L16
	JMP L15
L16:
	MOV AX, 1
	PUSH AX
	JMP L17
L15:
	MOV AX, 0
	PUSH AX
L17:
	POP AX
	CMP AX, 0
	JE L14
		;Line no 18
		;if else statement
	MOV AX, [BP-2]
	PUSH AX
	MOV AX, 3
	PUSH AX
	POP CX
	POP AX
	CWD
	DIV CX
	PUSH DX
	MOV AX, 0
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JE L19
	JMP L18
L19:
	MOV AX, 1
	PUSH AX
	JMP L20
L18:
	MOV AX, 0
	PUSH AX
L20:
	POP AX
	CMP AX, 0
	JNE L21
	JMP L22
L21:
		; Line no 19
	MOV AX, [BP-4]
	PUSH AX
	MOV AX, 5
	PUSH AX
	POP DX
	POP AX
	ADD AX, DX
	PUSH AX
	POP AX
	MOV [BP-4] , AX
	PUSH AX
	POP AX
	JMP L23
L22:
		; Line no 22
	MOV AX, [BP-4]
	PUSH AX
	MOV AX, 1
	PUSH AX
	POP DX
	POP AX
	SUB AX, DX
	PUSH AX
	POP AX
	MOV [BP-4] , AX
	PUSH AX
	POP AX
L23:
	MOV AX, [BP-2]
	PUSH AX
	INC AX
	MOV [BP-2] , AX
	POP AX
	JMP L13
L14:
		;Line no 26
	MOV AX, [BP-4]
	PUSH AX
	POP AX
	JMP L12
L12:		;returning from a function
	MOV SP, BP
	POP BP
	RET 4
g ENDP
		; FUNCTIONS ARE DEFINED HERE
f PROC 
		; pushing bp
	PUSH BP
	MOV BP , SP
		;Line no 2
		;variable declaration
	SUB SP, 2
		; Line no 3
	MOV AX, 5
	PUSH AX
	POP AX
	MOV [BP-2] , AX
	PUSH AX
	POP AX
		;Line no 4
L25:		;while loop initialize
	MOV AX, [BP-2]
	PUSH AX
	MOV AX, 0
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JG L28
	JMP L27
L28:
	MOV AX, 1
	PUSH AX
	JMP L29
L27:
	MOV AX, 0
	PUSH AX
L29:
	POP AX
	CMP AX, 0
	JE L26
		; Line no 5
	MOV AX, [BP+4]
	PUSH AX
	INC AX
	MOV [BP+4] , AX
	POP AX
		; Line no 6
	MOV AX, [BP-2]
	PUSH AX
	DEC AX
	MOV [BP-2] , AX
	POP AX
	JMP L25
L26:
		;Line no 8
	MOV AX, 3
	PUSH AX
	MOV AX, [BP+4]
	PUSH AX
	POP CX
	POP AX
	CWD
	MUL CX
	PUSH AX
	MOV AX, 7
	PUSH AX
	POP DX
	POP AX
	SUB AX, DX
	PUSH AX
	POP AX
	JMP L24
		; Line no 9
	MOV AX, 9
	PUSH AX
	POP AX
	MOV [BP+4] , AX
	PUSH AX
	POP AX
L24:		;returning from a function
	MOV SP, BP
	POP BP
	RET 2
f ENDP
new_line proc
	push ax
	push dx
	mov ah,2
	mov dl,cr
	int 21h
	mov ah,2
	mov dl,lf
	int 21h
	pop dx
	pop ax
	ret
new_line endp
print_output proc  ;print what is in ax
	push ax
	push bx
	push cx
	push dx
	push si
	lea si,number
	mov bx,10
	add si,4
	cmp ax,0
	jnge negate
	print:
	xor dx,dx
	div bx
	mov [si],dl
	add [si],'0'
	dec si
	cmp ax,0
	jne print
	inc si
	lea dx,si
	mov ah,9
	int 21h
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret
	negate:
	push ax
	mov ah,2
	mov dl,'-'
	int 21h
	pop ax
	neg ax
	jmp print
print_output endp
END main
