; 작성자 : 윤정도
; 작성일 : 2020-01-30 (토)

; 79p. 연습문제 (10)
;
; 다음 C 프로그램을 Assembly어로 번역하시오
;

; 1)
; int i;
;
; if (i < 10)
;     i = i + 1;
; else
;     i = 100;

; 2)

; int i;

; while (i >= 0)
; 	   i--;

segment .bss
extern i

segment .text
global test_1
test_1:
IF_1:		cmp		dword[i],		0
			jge		ELSE_1					;	if (i < 0)
			mov		eax,			[i]
			inc		eax
			mov		dword[i],		eax		;		i = i + 1
			jmp		DONE_1
											;	else
ELSE_1:		mov		dword[i],		100		;		i = 100
			jmp		DONE_1
DONE_1:		ret


global test_2
test_2:

WHILE_2		cmp		dword[i],		0
			jl		DONE_2					;	while (i >= 0)
			mov		eax,			[i]
			dec		eax
			mov		dword[i],		eax		;	i--
			jmp		WHILE_2
DONE_2:		ret