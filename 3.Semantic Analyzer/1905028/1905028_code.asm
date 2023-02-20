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
	POP AX
	MOV i , AX
	PUSH AX
	POP AX
		; Line no 7
	POP AX
		; Line no 8
	POP AX
	MOV j , AX
	PUSH AX
	POP AX
		; Line no 9
	POP AX
		; Line no 10
	POP AX
	MOV [BP-12] , AX
	PUSH AX
	POP AX
		; Line no 11
	POP AX
		; Line no 13
	POP AX
	MOV [BP-8] , AX
	PUSH AX
	POP AX
		; Line no 14
	POP AX
		; Line no 16
	POP AX
	MOV [BP-6] , AX
	PUSH AX
	POP AX
		; Line no 17
	POP AX
		; Line no 19
	POP AX
	MOV [BP-4] , AX
	PUSH AX
	POP AX
		; Line no 20
	POP AX
		; Line no 22
	POP AX
	MOV [BP-2] , AX
	PUSH AX
	POP AX
		; Line no 23
	POP AX
		; Line no 25
	POP AX
	MOV [BP-2] , AX
	PUSH AX
	POP AX
		; Line no 26
	POP AX
		; Line no 28
	POP AX
		; Line no 29
	POP AX
		; Line no 31
	POP AX
	MOV [BP-12] , AX
	PUSH AX
	POP AX
		; Line no 32
	POP AX
L1:		;returning from a function
	ADD SP, 12
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
