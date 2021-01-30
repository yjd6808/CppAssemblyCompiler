; 작성자 : 윤정도
; 작성일 : 2020-01-30 (토)

; 79p. 연습문제 (10)
;
; 다음 C 프로그램을 Assembly어로 번역하시오
;

; 1)

; if (a < b || a >= c)
; 		a = a + b;
; else if (b != c)
; 		a = a / 4
; else
; 		a = -c

; 2)

; for (a = 0; a < 100; a++)
; 		b = b - a + c;

segment .bss
extern a, b, c

segment .text
global test_1
test_1:

IF_1:			mov		eax,			dword[b]
				cmp		dword[a],		eax
				jl		IF_1_EXEC
				mov		eax,			dword[a]
				cmp		eax,			dword[c]
				jl		ELSE_IF_1

IF_1_EXEC:		mov		eax,			[a]
				add		eax,			[b]
				mov		dword[a],		eax
				jmp		DONE_1

ELSE_IF_1:		mov		eax,			dword[b]
				cmp		eax,			dword[c]
				je		ELSE_1
				cdq
				mov		eax,			dword[a]
				mov		ebx,			4
				idiv	ebx
				
				mov		dword[a],		eax
				jmp		DONE_1

ELSE_1:			mov		eax,			[c]
				neg		eax
				mov		dword[a],		eax
				jmp		DONE_1

DONE_1:			ret


global test_2
test_2:
				mov		dword[a],		0
FOR_2:			cmp		dword[a],		100
				jge		DONE_2
				mov		eax,			[b]
				sub		eax,			[a]
				add		eax,			[c]
				mov		dword[b],		eax
				mov		eax,			[a]
				inc		eax,
				mov		dword[a],		eax
				jmp		FOR_2
DONE_2:			ret
