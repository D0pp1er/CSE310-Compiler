.MODEL SMALL
.STACK 1000H
.Data
	CR EQU 0DH
	LF EQU 0AH
	number DB "00000$"
		;global variables are declared here
	array DW 16 DUP (0000H)
	fib_mem DW 24 DUP (0000H)
	_j DW 1 DUP (0000H)
	number1 DW 1 DUP (0000H)
	WORD DW 1 DUP (0000H)
	word1 DW 1 DUP (0000H)
.CODE
		; FUNCTIONS ARE DEFINED HERE
main PROC 
	MOV AX, @DATA
	MOV DS, AX
		; pushing bp
	PUSH BP
	MOV BP , SP
		;Line no 82
		;variable declaration
	SUB SP, 2
	SUB SP, 2
	SUB SP, 2
		; Line no 83
	MOV AX, 2
	PUSH AX
	POP AX
	MOV [BP-4] , AX
	PUSH AX
	POP AX
		; Line no 84
	MOV AX, 5
	PUSH AX
	POP AX
	MOV [BP-2] , AX
	PUSH AX
	POP AX
		; Line no 85
	MOV AX, [BP-2]
	PUSH AX
	MOV AX, [BP-4]
	PUSH AX
	CALL power
	PUSH AX
	POP AX
	MOV number1 , AX
	PUSH AX
	POP AX
		;Line no 86
		;calling println
	MOV AX, number1
	CALL print_output
	CALL new_line
		; Line no 87
	MOV AX, 7
	PUSH AX
	CALL factorial
	PUSH AX
	POP AX
	MOV number1 , AX
	PUSH AX
	POP AX
		;Line no 88
		;calling println
	MOV AX, number1
	CALL print_output
	CALL new_line
		; Line no 89
	CALL loop_test
	PUSH AX
	POP AX
		;Line no 91
		;for loop initialize
	MOV AX, 15
	PUSH AX
	POP AX
	MOV [BP-6] , AX
	PUSH AX
	POP AX
L2:		;loop starts here
	MOV AX, [BP-6]
	PUSH AX
	MOV AX, 0
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JGE L5
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
		; Line no 92
	MOV AX, 17000
	NEG AX
	PUSH AX
	MOV AX, 1000
	PUSH AX
	MOV AX, [BP-6]
	PUSH AX
	POP CX
	POP AX
	CWD
	IMUL CX
	PUSH AX
	POP DX
	POP AX
	SUB AX, DX
	PUSH AX
	MOV AX, [BP-6]
	PUSH AX
	POP SI
	SHL SI,1
	POP AX
	MOV array[SI] , AX
	PUSH AX
	POP AX
	MOV AX, [BP-6]
	PUSH AX
	DEC AX
	MOV [BP-6] , AX
	POP AX
	JMP L2
L3:
		; Line no 93
	MOV AX, 16
	PUSH AX
	POP AX
	MOV [BP-6] , AX
	PUSH AX
	POP AX
		;Line no 94
L7:		;while loop initialize
	MOV AX, [BP-6]
	PUSH AX
	DEC AX
	MOV [BP-6] , AX
	POP AX
	CMP AX, 0
	JE L8
		;Line no 95
		;variable declaration
	SUB SP, 2
		; Line no 96
	MOV AX, 15
	PUSH AX
	MOV AX, [BP-6]
	PUSH AX
	POP DX
	POP AX
	SUB AX, DX
	PUSH AX
	POP SI
	SHL SI,1
	MOV AX, array[SI]
	PUSH AX
	POP AX
	MOV [BP-8] , AX
	PUSH AX
	POP AX
		;Line no 97
		;calling println
	MOV AX, [BP-8]
	CALL print_output
	CALL new_line
	JMP L7
L8:
		;Line no 100
		;calling println
	MOV AX, [BP-6]
	CALL print_output
	CALL new_line
		; Line no 101
	MOV AX, 0
	PUSH AX
	POP AX
	MOV [BP-4] , AX
	PUSH AX
	POP AX
		; Line no 102
	MOV AX, 15
	PUSH AX
	POP AX
	MOV [BP-2] , AX
	PUSH AX
	POP AX
		; Line no 103
	MOV AX, [BP-2]
	PUSH AX
	MOV AX, [BP-4]
	PUSH AX
	CALL mergeSort
	PUSH AX
	POP AX
		;Line no 105
		;for loop initialize
	MOV AX, 0
	PUSH AX
	POP AX
	MOV [BP-6] , AX
	PUSH AX
	POP AX
L9:		;loop starts here
	MOV AX, [BP-6]
	PUSH AX
	MOV AX, 16
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JL L12
	JMP L11
L12:
	MOV AX, 1
	PUSH AX
	JMP L13
L11:
	MOV AX, 0
	PUSH AX
L13:
	POP AX
	CMP AX, 0
	JE L10
		;Line no 106
		;if else statement
	MOV AX, [BP-6]
	PUSH AX
	MOV AX, 0
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JGE L15
	JMP L14
L15:
	MOV AX, 1
	PUSH AX
	JMP L16
L14:
	MOV AX, 0
	PUSH AX
L16:
	POP AX
	CMP AX, 0
	JNE L18
	CALL MERGE
	PUSH AX
	POP AX
	CMP AX,0
	JE L17
L18:
	MOV AX, 1
	PUSH AX
	JMP L19
L17:
	MOV AX, 0
	PUSH AX
L19:
	POP AX
	CMP AX, 0
	JE L20
		; Line no 107
	MOV AX, 1
	PUSH AX
	POP AX
	MOV WORD , AX
	PUSH AX
	POP AX
		; Line no 108
	MOV AX, 3
	PUSH AX
	POP AX
	MOV WORD , AX
	PUSH AX
	POP AX
		; Line no 109
	MOV AX, [BP-6]
	PUSH AX
	POP SI
	SHL SI,1
	MOV AX, array[SI]
	PUSH AX
	POP AX
	MOV WORD , AX
	PUSH AX
	POP AX
		;Line no 110
		;calling println
	MOV AX, WORD
	CALL print_output
	CALL new_line
L20:
	MOV AX, [BP-6]
	PUSH AX
	INC AX
	MOV [BP-6] , AX
	POP AX
	JMP L9
L10:
		;Line no 113
		;for loop initialize
	MOV AX, 0
	PUSH AX
	POP AX
	MOV [BP-6] , AX
	PUSH AX
	POP AX
L21:		;loop starts here
	MOV AX, [BP-6]
	PUSH AX
	MOV AX, 16
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
	JE L22
		;Line no 114
		;if else statement
	MOV AX, [BP-6]
	PUSH AX
	MOV AX, 0
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JL L27
	JMP L26
L27:
	MOV AX, 1
	PUSH AX
	JMP L28
L26:
	MOV AX, 0
	PUSH AX
L28:
	POP AX
	CMP AX, 0
	JE L29
	CALL MERGE
	PUSH AX
	POP AX
	CMP AX,0
	JNE L30
L29:
	MOV AX, 0
	PUSH AX
	JMP L31
L30:
	MOV AX, 1
	PUSH AX
L31:
	POP AX
	CMP AX, 0
	JE L32
		; Line no 115
	MOV AX, [BP-6]
	PUSH AX
	POP SI
	SHL SI,1
	MOV AX, array[SI]
	PUSH AX
	POP AX
	MOV _j , AX
	PUSH AX
	POP AX
		;Line no 116
		;calling println
	MOV AX, _j
	CALL print_output
	CALL new_line
L32:
	MOV AX, [BP-6]
	PUSH AX
	INC AX
	MOV [BP-6] , AX
	POP AX
	JMP L21
L22:
		; Line no 119
	MOV AX, 200
	PUSH AX
	POP AX
	MOV word1 , AX
	PUSH AX
	POP AX
		;Line no 120
		;calling println
	MOV AX, word1
	CALL print_output
	CALL new_line
		; Line no 121
	MOV AX, 23
	PUSH AX
	CALL fibonacci
	PUSH AX
	POP AX
		;Line no 122
		;for loop initialize
	MOV AX, 0
	PUSH AX
	POP AX
	MOV [BP-6] , AX
	PUSH AX
	POP AX
L33:		;loop starts here
	MOV AX, [BP-6]
	PUSH AX
	MOV AX, 24
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JL L36
	JMP L35
L36:
	MOV AX, 1
	PUSH AX
	JMP L37
L35:
	MOV AX, 0
	PUSH AX
L37:
	POP AX
	CMP AX, 0
	JE L34
		;Line no 123
		;variable declaration
	SUB SP, 2
		; Line no 124
	MOV AX, [BP-6]
	PUSH AX
	POP SI
	SHL SI,1
	MOV AX, fib_mem[SI]
	PUSH AX
	POP AX
	MOV [BP-10] , AX
	PUSH AX
	POP AX
		;Line no 125
		;calling println
	MOV AX, [BP-10]
	CALL print_output
	CALL new_line
	MOV AX, [BP-6]
	PUSH AX
	INC AX
	MOV [BP-6] , AX
	POP AX
	JMP L33
L34:
L1:		;returning from a function
	MOV SP, BP
	POP BP
	MOV AX,4CH
	INT 21H
main ENDP
		; FUNCTIONS ARE DEFINED HERE
loop_test PROC 
		; pushing bp
	PUSH BP
	MOV BP , SP
		;Line no 65
		;variable declaration
	SUB SP, 2
		;Line no 66
		;for loop initialize
	MOV AX, 0
	PUSH AX
	POP AX
	MOV [BP-2] , AX
	PUSH AX
	POP AX
L39:		;loop starts here
	MOV AX, [BP-2]
	PUSH AX
	MOV AX, 100
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JL L42
	JMP L41
L42:
	MOV AX, 1
	PUSH AX
	JMP L43
L41:
	MOV AX, 0
	PUSH AX
L43:
	POP AX
	CMP AX, 0
	JE L40
		;Line no 67
		;variable declaration
	SUB SP, 200
		; Line no 68
	MOV AX, 0
	PUSH AX
	MOV AX, 97
	PUSH AX
	POP SI
	SHL SI,1
	NEG SI
	ADD SI, 202
	NEG SI
	POP AX
	MOV BP[SI] , AX
	PUSH AX
	POP AX
		; Line no 69
	MOV AX, 0
	PUSH AX
	MOV AX, 98
	PUSH AX
	POP SI
	SHL SI,1
	NEG SI
	ADD SI, 202
	NEG SI
	POP AX
	MOV BP[SI] , AX
	PUSH AX
	POP AX
		; Line no 70
	MOV AX, 98
	PUSH AX
	POP SI
	SHL SI,1
	NEG SI
	ADD SI, 202
	NEG SI
	MOV AX, BP[SI]
	PUSH AX
	MOV AX, 97
	PUSH AX
	POP SI
	SHL SI,1
	NEG SI
	ADD SI, 202
	NEG SI
	MOV AX, BP[SI]
	PUSH AX
	POP DX
	POP AX
	ADD AX, DX
	PUSH AX
	MOV AX, 111
	PUSH AX
	POP DX
	POP AX
	ADD AX, DX
	PUSH AX
	MOV AX, 99
	PUSH AX
	POP SI
	SHL SI,1
	NEG SI
	ADD SI, 202
	NEG SI
	POP AX
	MOV BP[SI] , AX
	PUSH AX
	POP AX
		;Line no 71
		;if else statement
	MOV AX, [BP-2]
	PUSH AX
	MOV AX, 97
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JE L45
	JMP L44
L45:
	MOV AX, 1
	PUSH AX
	JMP L46
L44:
	MOV AX, 0
	PUSH AX
L46:
	POP AX
	CMP AX, 0
	JE L47
		;Line no 72
		;variable declaration
	SUB SP, 2
		; Line no 73
	MOV AX, 99
	PUSH AX
	POP SI
	SHL SI,1
	NEG SI
	ADD SI, 202
	NEG SI
	MOV AX, BP[SI]
	PUSH AX
	POP AX
	MOV [BP-204] , AX
	PUSH AX
	POP AX
		;Line no 74
		;calling println
	MOV AX, [BP-204]
	CALL print_output
	CALL new_line
		;Line no 75
	MOV AX, 0
	PUSH AX
	POP AX
	JMP L38
L47:
	MOV AX, [BP-2]
	PUSH AX
	INC AX
	MOV [BP-2] , AX
	POP AX
	JMP L39
L40:
		;Line no 78
		;calling println
	MOV AX, [BP-2]
	CALL print_output
	CALL new_line
L38:		;returning from a function
	MOV SP, BP
	POP BP
	RET
loop_test ENDP
		; FUNCTIONS ARE DEFINED HERE
MERGE PROC 
		; pushing bp
	PUSH BP
	MOV BP , SP
		; Line no 59
	MOV AX, 15000
	NEG AX
	PUSH AX
	POP AX
	MOV number1 , AX
	PUSH AX
	POP AX
		;Line no 60
		;calling println
	MOV AX, number1
	CALL print_output
	CALL new_line
		;Line no 61
	MOV AX, 1
	PUSH AX
	POP AX
	JMP L48
L48:		;returning from a function
	MOV SP, BP
	POP BP
	RET
MERGE ENDP
		; FUNCTIONS ARE DEFINED HERE
mergeSort PROC 
		; pushing bp
	PUSH BP
	MOV BP , SP
		;Line no 47
		;if else statement
	MOV AX, [BP+4]
	PUSH AX
	MOV AX, [BP+6]
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JGE L51
	JMP L50
L51:
	MOV AX, 1
	PUSH AX
	JMP L52
L50:
	MOV AX, 0
	PUSH AX
L52:
	POP AX
	CMP AX, 0
	JE L53
		;Line no 48
	MOV AX, 0
	PUSH AX
	POP AX
	JMP L49
L53:
		;Line no 50
		;variable declaration
	SUB SP, 2
		; Line no 51
	MOV AX, [BP+4]
	PUSH AX
	MOV AX, [BP+6]
	PUSH AX
	MOV AX, [BP+4]
	PUSH AX
	POP DX
	POP AX
	SUB AX, DX
	PUSH AX
	MOV AX, 2
	PUSH AX
	POP CX
	POP AX
	CWD
	IDIV CX
	PUSH AX
	POP DX
	POP AX
	ADD AX, DX
	PUSH AX
	POP AX
	MOV [BP-2] , AX
	PUSH AX
	POP AX
		; Line no 52
	MOV AX, [BP-2]
	PUSH AX
	MOV AX, [BP+4]
	PUSH AX
	CALL mergeSort
	PUSH AX
	POP AX
		; Line no 53
	MOV AX, [BP+6]
	PUSH AX
	MOV AX, [BP-2]
	PUSH AX
	MOV AX, 1
	PUSH AX
	POP DX
	POP AX
	ADD AX, DX
	PUSH AX
	CALL mergeSort
	PUSH AX
	POP AX
		; Line no 54
	MOV AX, [BP+6]
	PUSH AX
	MOV AX, [BP-2]
	PUSH AX
	MOV AX, [BP+4]
	PUSH AX
	CALL merge1
	PUSH AX
	POP AX
		;Line no 55
	MOV AX, 0
	PUSH AX
	POP AX
	JMP L49
L49:		;returning from a function
	MOV SP, BP
	POP BP
	RET 4
mergeSort ENDP
		; FUNCTIONS ARE DEFINED HERE
merge1 PROC 
		; pushing bp
	PUSH BP
	MOV BP , SP
		;Line no 27
		;variable declaration
	SUB SP, 2
	SUB SP, 2
		;Line no 28
		;variable declaration
	SUB SP, 32
		; Line no 29
	MOV AX, [BP+4]
	PUSH AX
	POP AX
	MOV [BP-4] , AX
	PUSH AX
	POP AX
		; Line no 30
	MOV AX, [BP+6]
	PUSH AX
	MOV AX, 1
	PUSH AX
	POP DX
	POP AX
	ADD AX, DX
	PUSH AX
	POP AX
	MOV [BP-2] , AX
	PUSH AX
	POP AX
		;Line no 31
		;variable declaration
	SUB SP, 2
		; Line no 32
	MOV AX, 0
	PUSH AX
	POP AX
	MOV [BP-38] , AX
	PUSH AX
	POP AX
		;Line no 34
		;for loop initialize
	MOV AX, 0
	PUSH AX
	POP AX
	MOV [BP-38] , AX
	PUSH AX
	POP AX
L55:		;loop starts here
	MOV AX, [BP-38]
	PUSH AX
	MOV AX, [BP+8]
	PUSH AX
	MOV AX, [BP+4]
	PUSH AX
	POP DX
	POP AX
	SUB AX, DX
	PUSH AX
	MOV AX, 1
	PUSH AX
	POP DX
	POP AX
	ADD AX, DX
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JL L58
	JMP L57
L58:
	MOV AX, 1
	PUSH AX
	JMP L59
L57:
	MOV AX, 0
	PUSH AX
L59:
	POP AX
	CMP AX, 0
	JE L56
		;Line no 35
		;if else statement
	MOV AX, [BP-4]
	PUSH AX
	MOV AX, [BP+6]
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JG L61
	JMP L60
L61:
	MOV AX, 1
	PUSH AX
	JMP L62
L60:
	MOV AX, 0
	PUSH AX
L62:
	POP AX
	CMP AX, 0
	JNE L63
	JMP L64
L63:
		; Line no 35
	MOV AX, [BP-2]
	PUSH AX
	INC AX
	MOV [BP-2] , AX
	POP SI
	SHL SI,1
	MOV AX, array[SI]
	PUSH AX
	MOV AX, [BP-38]
	PUSH AX
	POP SI
	SHL SI,1
	NEG SI
	ADD SI, 36
	NEG SI
	POP AX
	MOV BP[SI] , AX
	PUSH AX
	POP AX
	JMP L65
L64:
	MOV AX, [BP-2]
	PUSH AX
	MOV AX, [BP+8]
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JG L67
	JMP L66
L67:
	MOV AX, 1
	PUSH AX
	JMP L68
L66:
	MOV AX, 0
	PUSH AX
L68:
	POP AX
	CMP AX, 0
	JNE L70
	JMP L69
L70:
		; Line no 36
	MOV AX, [BP-4]
	PUSH AX
	INC AX
	MOV [BP-4] , AX
	POP SI
	SHL SI,1
	MOV AX, array[SI]
	PUSH AX
	MOV AX, [BP-38]
	PUSH AX
	POP SI
	SHL SI,1
	NEG SI
	ADD SI, 36
	NEG SI
	POP AX
	MOV BP[SI] , AX
	PUSH AX
	POP AX
	JMP L65
L69:
	MOV AX, [BP-4]
	PUSH AX
	POP SI
	SHL SI,1
	MOV AX, array[SI]
	PUSH AX
	MOV AX, [BP-2]
	PUSH AX
	POP SI
	SHL SI,1
	MOV AX, array[SI]
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JLE L72
	JMP L71
L72:
	MOV AX, 1
	PUSH AX
	JMP L73
L71:
	MOV AX, 0
	PUSH AX
L73:
	POP AX
	CMP AX, 0
	JNE L75
	JMP L74
L75:
		; Line no 37
	MOV AX, [BP-4]
	PUSH AX
	INC AX
	MOV [BP-4] , AX
	POP SI
	SHL SI,1
	MOV AX, array[SI]
	PUSH AX
	MOV AX, [BP-38]
	PUSH AX
	POP SI
	SHL SI,1
	NEG SI
	ADD SI, 36
	NEG SI
	POP AX
	MOV BP[SI] , AX
	PUSH AX
	POP AX
	JMP L65
L74:
		; Line no 38
	MOV AX, [BP-2]
	PUSH AX
	INC AX
	MOV [BP-2] , AX
	POP SI
	SHL SI,1
	MOV AX, array[SI]
	PUSH AX
	MOV AX, [BP-38]
	PUSH AX
	POP SI
	SHL SI,1
	NEG SI
	ADD SI, 36
	NEG SI
	POP AX
	MOV BP[SI] , AX
	PUSH AX
	POP AX
L65:
	MOV AX, [BP-38]
	PUSH AX
	INC AX
	MOV [BP-38] , AX
	POP AX
	JMP L55
L56:
		;Line no 41
		;for loop initialize
	MOV AX, 0
	PUSH AX
	POP AX
	MOV [BP-38] , AX
	PUSH AX
	POP AX
L76:		;loop starts here
	MOV AX, [BP-38]
	PUSH AX
	MOV AX, [BP+8]
	PUSH AX
	MOV AX, [BP+4]
	PUSH AX
	POP DX
	POP AX
	SUB AX, DX
	PUSH AX
	MOV AX, 1
	PUSH AX
	POP DX
	POP AX
	ADD AX, DX
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JL L79
	JMP L78
L79:
	MOV AX, 1
	PUSH AX
	JMP L80
L78:
	MOV AX, 0
	PUSH AX
L80:
	POP AX
	CMP AX, 0
	JE L77
		; Line no 42
	MOV AX, [BP-38]
	PUSH AX
	POP SI
	SHL SI,1
	NEG SI
	ADD SI, 36
	NEG SI
	MOV AX, BP[SI]
	PUSH AX
	MOV AX, [BP+4]
	PUSH AX
	MOV AX, [BP-38]
	PUSH AX
	POP DX
	POP AX
	ADD AX, DX
	PUSH AX
	POP SI
	SHL SI,1
	POP AX
	MOV array[SI] , AX
	PUSH AX
	POP AX
	MOV AX, [BP-38]
	PUSH AX
	INC AX
	MOV [BP-38] , AX
	POP AX
	JMP L76
L77:
L54:		;returning from a function
	MOV SP, BP
	POP BP
	RET 6
merge1 ENDP
		; FUNCTIONS ARE DEFINED HERE
power PROC 
		; pushing bp
	PUSH BP
	MOV BP , SP
		;Line no 22
		;if else statement
	MOV AX, [BP+6]
	PUSH AX
	MOV AX, 0
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JE L83
	JMP L82
L83:
	MOV AX, 1
	PUSH AX
	JMP L84
L82:
	MOV AX, 0
	PUSH AX
L84:
	POP AX
	CMP AX, 0
	JE L85
		;Line no 22
	MOV AX, 1
	PUSH AX
	POP AX
	JMP L81
L85:
		;Line no 23
	MOV AX, [BP+4]
	PUSH AX
	MOV AX, [BP+6]
	PUSH AX
	MOV AX, 1
	PUSH AX
	POP DX
	POP AX
	SUB AX, DX
	PUSH AX
	MOV AX, [BP+4]
	PUSH AX
	CALL power
	PUSH AX
	POP CX
	POP AX
	CWD
	IMUL CX
	PUSH AX
	POP AX
	JMP L81
L81:		;returning from a function
	MOV SP, BP
	POP BP
	RET 4
power ENDP
		; FUNCTIONS ARE DEFINED HERE
factorial PROC 
		; pushing bp
	PUSH BP
	MOV BP , SP
		;Line no 15
		;if else statement
	MOV AX, [BP+4]
	PUSH AX
	MOV AX, 1
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JE L88
	JMP L87
L88:
	MOV AX, 1
	PUSH AX
	JMP L89
L87:
	MOV AX, 0
	PUSH AX
L89:
	POP AX
	CMP AX, 0
	JE L90
		;Line no 15
	MOV AX, [BP+4]
	PUSH AX
	POP AX
	JMP L86
L90:
		;Line no 16
		;variable declaration
	SUB SP, 2
		; Line no 17
	MOV AX, [BP+4]
	PUSH AX
	MOV AX, [BP+4]
	PUSH AX
	MOV AX, 1
	PUSH AX
	POP DX
	POP AX
	SUB AX, DX
	PUSH AX
	CALL factorial
	PUSH AX
	POP CX
	POP AX
	CWD
	IMUL CX
	PUSH AX
	POP AX
	MOV [BP-2] , AX
	PUSH AX
	POP AX
		;Line no 18
	MOV AX, [BP-2]
	PUSH AX
	POP AX
	JMP L86
L86:		;returning from a function
	MOV SP, BP
	POP BP
	RET 2
factorial ENDP
		; FUNCTIONS ARE DEFINED HERE
fibonacci PROC 
		; pushing bp
	PUSH BP
	MOV BP , SP
		;Line no 5
		;if else statement
	MOV AX, [BP+4]
	PUSH AX
	POP SI
	SHL SI,1
	MOV AX, fib_mem[SI]
	PUSH AX
	MOV AX, 0
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JNE L93
	JMP L92
L93:
	MOV AX, 1
	PUSH AX
	JMP L94
L92:
	MOV AX, 0
	PUSH AX
L94:
	POP AX
	CMP AX, 0
	JE L95
		;Line no 5
	MOV AX, [BP+4]
	PUSH AX
	POP SI
	SHL SI,1
	MOV AX, fib_mem[SI]
	PUSH AX
	POP AX
	JMP L91
L95:
		;Line no 6
		;if else statement
	MOV AX, [BP+4]
	PUSH AX
	MOV AX, 0
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JE L97
	JMP L96
L97:
	MOV AX, 1
	PUSH AX
	JMP L98
L96:
	MOV AX, 0
	PUSH AX
L98:
	POP AX
	CMP AX, 0
	JNE L100
	MOV AX, [BP+4]
	PUSH AX
	MOV AX, 1
	PUSH AX
	POP DX
	POP AX
	CMP AX,DX
	JE L103
	JMP L102
L103:
	MOV AX, 1
	PUSH AX
	JMP L104
L102:
	MOV AX, 0
	PUSH AX
L104:
	POP AX
	CMP AX,0
	JE L99
L100:
	MOV AX, 1
	PUSH AX
	JMP L101
L99:
	MOV AX, 0
	PUSH AX
L101:
	POP AX
	CMP AX, 0
	JE L105
		; Line no 7
	MOV AX, [BP+4]
	PUSH AX
	MOV AX, [BP+4]
	PUSH AX
	POP SI
	SHL SI,1
	POP AX
	MOV fib_mem[SI] , AX
	PUSH AX
	POP AX
		;Line no 8
	MOV AX, [BP+4]
	PUSH AX
	POP SI
	SHL SI,1
	MOV AX, fib_mem[SI]
	PUSH AX
	POP AX
	JMP L91
L105:
		; Line no 10
	MOV AX, [BP+4]
	PUSH AX
	MOV AX, 1
	PUSH AX
	POP DX
	POP AX
	SUB AX, DX
	PUSH AX
	CALL fibonacci
	PUSH AX
	MOV AX, [BP+4]
	PUSH AX
	MOV AX, 2
	PUSH AX
	POP DX
	POP AX
	SUB AX, DX
	PUSH AX
	CALL fibonacci
	PUSH AX
	POP DX
	POP AX
	ADD AX, DX
	PUSH AX
	MOV AX, [BP+4]
	PUSH AX
	POP SI
	SHL SI,1
	POP AX
	MOV fib_mem[SI] , AX
	PUSH AX
	POP AX
		;Line no 11
	MOV AX, [BP+4]
	PUSH AX
	POP SI
	SHL SI,1
	MOV AX, fib_mem[SI]
	PUSH AX
	POP AX
	JMP L91
L91:		;returning from a function
	MOV SP, BP
	POP BP
	RET 2
fibonacci ENDP
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
