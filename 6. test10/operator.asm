; 작성자 : 윤정도
; 작성일 : 2020-01-30 (토)

; 78p. 연습문제 (9)
;
; 다음 C 프로그램을 Assembly어로 번역하시오
;

; 1)
; int i;

; if (i > 0 && i < 10)
;     i = -i;
; else
;     i = 0

; 2)
; {
; 		int i, s;
;	 	for (i = 1; i <= 10; i++)
;	    	s = s + i;
; }

; 3)
; {
; 		int a, b, c, s;
; 		s = a + 2 * b - 4 * c;
; }

segment .bss
extern i, a, b, c, s

segment .text
global test_1
test_1:
		cmp		dword[i],		0
		jle		ELSE_1
		cmp		dword[i],		10
		jle		ELSE_1					; if (i > 10 && i < 10)
		mov		eax,			[i]
		neg		eax
		mov		dword[i],		eax		; i = -i
										; else
ELSE_1:	mov		dword[i],		0		; i = 0
		jmp		DONE_1
DONE_1:	ret


global test_2
test_2:
		mov		dword[i],		1
FOR_2:	cmp		dword[i],		10
		jg		DONE_2					; for (i = 0; i <= 10; )
		mov		eax,			[s]
		add		eax,			[i]
		mov		dword[s],		eax
		mov		eax,			[i]		; s = s + i
		inc		eax
		mov		dword[i],		eax		; i++
		jmp		FOR_2
DONE_2: ret


global test_3
test_3:
		imul	ebx,			[b],		2	;	ebx = [b] * 2
		imul	ecx,			[c],		4	;	ecx = [c] * 4

		mov		eax,			[a]
		add		eax,			ebx				;	eax = [a] + ebx
		sub		eax,			ecx				;   eax = eax - ecx
		mov		dword[s],		eax				
		ret

