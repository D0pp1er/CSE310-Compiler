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
		;Line no 3
		;variable declaration
	SUB SP, 2
	SUB SP, 2
	SUB SP, 2
		; Line no 5
	MOV AX, 3
	PUSH AX
	POP AX
	MOV [BP-6] , AX
	PUSH AX
	POP AX
		; Line no 6
	MOV AX, 8
	PUSH AX
	POP AX
	MOV [BP-4] , AX
	PUSH AX
	POP AX
		; Line no 7
	MOV AX, 6
	PUSH AX
	POP AX
	MOV [BP-2] , AX
	PUSH AX
	POP AX
		;Line no 10
		;if else statement
	MOV AX, [BP-6]
	PUSH AX
	MOV AX, 3
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JE L3
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
	CMP AX, 0
	JE L5
		;Line no 11
		;calling println
	MOV AX, [BP-4]
	CALL print_output
	CALL new_line
L5:
		;Line no 14
		;if else statement
	MOV AX, [BP-4]
	PUSH AX
	MOV AX, 8
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JL L7
	JMP L6
L7:
	MOV AX, 1
	PUSH AX
	JMP L8
L6:
	MOV AX, 0
	PUSH AX
L8:
	POP AX
	CMP AX, 0
	JNE L9
	JMP L10
L9:
		;Line no 15
		;calling println
	MOV AX, [BP-6]
	CALL print_output
	CALL new_line
	JMP L11
L10:
		;Line no 18
		;calling println
	MOV AX, [BP-2]
	CALL print_output
	CALL new_line
L11:
		;Line no 21
		;if else statement
	MOV AX, [BP-2]
	PUSH AX
	MOV AX, 6
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JNE L13
	JMP L12
L13:
	MOV AX, 1
	PUSH AX
	JMP L14
L12:
	MOV AX, 0
	PUSH AX
L14:
	POP AX
	CMP AX, 0
	JNE L15
	JMP L16
L15:
		;Line no 22
		;calling println
	MOV AX, [BP-2]
	CALL print_output
	CALL new_line
	JMP L17
L16:
	MOV AX, [BP-4]
	PUSH AX
	MOV AX, 8
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JG L19
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
	JNE L22
	JMP L21
L22:
		;Line no 25
		;calling println
	MOV AX, [BP-4]
	CALL print_output
	CALL new_line
	JMP L17
L21:
	MOV AX, [BP-6]
	PUSH AX
	MOV AX, 5
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JL L24
	JMP L23
L24:
	MOV AX, 1
	PUSH AX
	JMP L25
L23:
	MOV AX, 0
	PUSH AX
L25:
	POP AX
	CMP AX, 0
	JNE L27
	JMP L26
L27:
		;Line no 28
		;calling println
	MOV AX, [BP-6]
	CALL print_output
	CALL new_line
	JMP L17
L26:
		; Line no 31
	MOV AX, 0
	PUSH AX
	POP AX
	MOV [BP-2] , AX
	PUSH AX
	POP AX
		;Line no 32
		;calling println
	MOV AX, [BP-2]
	CALL print_output
	CALL new_line
L17:
		;Line no 36
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
