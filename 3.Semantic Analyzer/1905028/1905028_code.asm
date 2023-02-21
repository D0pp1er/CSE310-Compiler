.MODEL SMALL
.STACK 1000H
.Data
	CR EQU 0DH
	LF EQU 0AH
	number DB "00000$"
		;global variables are declared here
	i DW 1 DUP (0000H)
	j DW 1 DUP (0000H)
.CODE
		; FUNCTIONS ARE DEFINED HERE
main PROC 
	MOV AX, @DATA
	MOV DS, AX
		; pushing bp
	PUSH BP
	MOV BP , SP
		;Line no 4
		;variable declaration
	SUB SP, 2
	SUB SP, 2
	SUB SP, 2
	SUB SP, 2
	SUB SP, 2
	SUB SP, 2
		; Line no 6
	MOV AX, 1
	PUSH AX
	POP AX
	MOV i , AX
	PUSH AX
	POP AX
		;Line no 7
		;calling println
	MOV AX, i
	CALL print_output
	CALL new_line
		; Line no 8
	MOV AX, 5
	PUSH AX
	MOV AX, 8
	PUSH AX
	POP DX
	POP AX
	ADD AX, DX
	PUSH AX
	POP AX
	MOV j , AX
	PUSH AX
	POP AX
		;Line no 9
		;calling println
	MOV AX, j
	CALL print_output
	CALL new_line
		; Line no 10
	MOV AX, i
	PUSH AX
	MOV AX, 2
	PUSH AX
	MOV AX, j
	PUSH AX
	POP CX
	POP AX
	CWD
	MUL CX
	PUSH AX
	POP DX
	POP AX
	ADD AX, DX
	PUSH AX
	POP AX
	MOV [BP-12] , AX
	PUSH AX
	POP AX
		;Line no 11
		;calling println
	MOV AX, [BP-12]
	CALL print_output
	CALL new_line
		; Line no 13
	MOV AX, [BP-12]
	PUSH AX
	MOV AX, 9
	PUSH AX
	POP CX
	POP AX
	CWD
	DIV CX
	PUSH DX
	POP AX
	MOV [BP-8] , AX
	PUSH AX
	POP AX
		;Line no 14
		;calling println
	MOV AX, [BP-8]
	CALL print_output
	CALL new_line
		; Line no 16
	MOV AX, [BP-8]
	PUSH AX
	MOV AX, [BP-10]
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JLE L3
	JMP L2
L3:
	MOV AX, 1
	PUSH AX
	JMP L4
L2:
	MOV AX, 0
	PUSH AX
L4:
	POP AX
	MOV [BP-6] , AX
	PUSH AX
	POP AX
		;Line no 17
		;calling println
	MOV AX, [BP-6]
	CALL print_output
	CALL new_line
		; Line no 19
	MOV AX, i
	PUSH AX
	MOV AX, j
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JNE L6
	JMP L5
L6:
	MOV AX, 1
	PUSH AX
	JMP L7
L5:
	MOV AX, 0
	PUSH AX
L7:
	POP AX
	MOV [BP-4] , AX
	PUSH AX
	POP AX
		;Line no 20
		;calling println
	MOV AX, [BP-4]
	CALL print_output
	CALL new_line
		; Line no 22
	MOV AX, [BP-6]
	PUSH AX
	POP AX
	CMP AX, 0
	JNE L9
	MOV AX, [BP-4]
	PUSH AX
	POP AX
	CMP AX,0
	JE L8
L9:
	MOV AX, 1
	PUSH AX
	JMP L10
L8:
	MOV AX, 0
	PUSH AX
L10:
	POP AX
	MOV [BP-2] , AX
	PUSH AX
	POP AX
		;Line no 23
		;calling println
	MOV AX, [BP-2]
	CALL print_output
	CALL new_line
		; Line no 25
	MOV AX, [BP-6]
	PUSH AX
	POP AX
	CMP AX, 0
	JE L11
	MOV AX, [BP-4]
	PUSH AX
	POP AX
	CMP AX,0
	JNE L12
L11:
	MOV AX, 0
	PUSH AX
	JMP L13
L12:
	MOV AX, 1
	PUSH AX
L13:
	POP AX
	MOV [BP-2] , AX
	PUSH AX
	POP AX
		;Line no 26
		;calling println
	MOV AX, [BP-2]
	CALL print_output
	CALL new_line
		; Line no 28
	MOV AX, [BP-2]
	PUSH AX
	INC AX
	MOV [BP-2] , AX
	POP AX
		;Line no 29
		;calling println
	MOV AX, [BP-2]
	CALL print_output
	CALL new_line
		; Line no 31
	MOV AX, [BP-2]
	NEG AX
	PUSH AX
	POP AX
	MOV [BP-12] , AX
	PUSH AX
	POP AX
		;Line no 32
		;calling println
	MOV AX, [BP-12]
	CALL print_output
	CALL new_line
		;Line no 37
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
