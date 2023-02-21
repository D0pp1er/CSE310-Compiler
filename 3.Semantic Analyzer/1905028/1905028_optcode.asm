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
		;Line no 16
		;variable declaration
	SUB SP, 2
		; Line no 17
	MOV AX, 7
	PUSH AX
	CALL func
		;removed consecutive push and pop of same register
	MOV [BP-2] , AX
		;removed consecutive push and pop of same register
		;Line no 18
		;calling println
	MOV AX, [BP-2]
	CALL print_output
	CALL new_line
		;Line no 19
	MOV AX, 0
		;removed consecutive push and pop of same register
	JMP L1
L1:		;returning from a function
	MOV SP, BP
	POP BP
	MOV AX,4CH
	INT 21H
main ENDP
		; FUNCTIONS ARE DEFINED HERE
func2 PROC 
		; pushing bp
	PUSH BP
	MOV BP , SP
		;Line no 9
		;variable declaration
	SUB SP, 2
		;Line no 10
		;if else statement
	MOV AX, [BP+4]
	PUSH AX
	MOV AX, 0
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JE L4
	JMP L3
L4:
	MOV AX, 1
	PUSH AX
	JMP L5
L3:
	MOV AX, 0
	PUSH AX
L5:
	POP AX
	CMP AX, 0
	JE L6
		;Line no 10
	MOV AX, 0
		;removed consecutive push and pop of same register
	JMP L2
L6:
		; Line no 11
	MOV AX, [BP+4]
		;removed consecutive push and pop of same register
	MOV [BP-2] , AX
		;removed consecutive push and pop of same register
		;Line no 12
	MOV AX, [BP+4]
	PUSH AX
	MOV AX, 1
	PUSH AX
	POP DX
	POP AX
	SUB AX, DX
	PUSH AX
	CALL func
	PUSH AX
	MOV AX, [BP-2]
	PUSH AX
	POP DX
	POP AX
	ADD AX, DX
		;removed consecutive push and pop of same register
	JMP L2
L2:		;returning from a function
	MOV SP, BP
	POP BP
	RET 2
func2 ENDP
		; FUNCTIONS ARE DEFINED HERE
func PROC 
		; pushing bp
	PUSH BP
	MOV BP , SP
		;Line no 2
		;variable declaration
	SUB SP, 2
		;Line no 3
		;if else statement
	MOV AX, [BP+4]
	PUSH AX
	MOV AX, 0
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JE L9
	JMP L8
L9:
	MOV AX, 1
	PUSH AX
	JMP L10
L8:
	MOV AX, 0
	PUSH AX
L10:
	POP AX
	CMP AX, 0
	JE L11
		;Line no 3
	MOV AX, 0
		;removed consecutive push and pop of same register
	JMP L7
L11:
		; Line no 4
	MOV AX, [BP+4]
		;removed consecutive push and pop of same register
	MOV [BP-2] , AX
		;removed consecutive push and pop of same register
		;Line no 5
	MOV AX, [BP+4]
	PUSH AX
	MOV AX, 1
	PUSH AX
	POP DX
	POP AX
	SUB AX, DX
	PUSH AX
	CALL func
	PUSH AX
	MOV AX, [BP-2]
	PUSH AX
	POP DX
	POP AX
	ADD AX, DX
		;removed consecutive push and pop of same register
	JMP L7
L7:		;returning from a function
	MOV SP, BP
	POP BP
	RET 2
func ENDP
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
