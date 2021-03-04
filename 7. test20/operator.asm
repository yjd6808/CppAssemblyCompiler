; 작성자 : 윤정도
; 작성일 : 2020-02-07 (일)

; 120p. 연습문제 - 20
; 1) 아래 f함수를 어셈블리어로 번역하시오. 함수 프롤로그, 에필로그, 어셈블러 디렉티브를 포함할 것

; int value;

; void f(int a, int b)
; {
;     int n, m;
;     n = a + b;
;     m = a * b;

;     if (n > m)
;         value = 0;
;     else
;         value = 1;
; }

segment .bss
global value
value		resd		1

segment .text
global f
f:
			push	ebp
			mov		ebp,			esp
			sub		esp,			8

			mov		eax,			[ebp + 8]
			add		eax,			[ebp + 12]
			mov		[ebp - 8],		eax			;	n = a + b

			mov		eax,			[ebp + 8]
			imul	eax,			[ebp + 12]
			mov		[ebp - 4],		eax			;	m = a * b

			mov		eax,			[ebp - 8]
			cmp		eax,			[ebp - 4]
			jle		ELSE
			mov		dword[value],	0
			jmp		DONE
ELSE:		mov		dword[value],	1
			jmp		DONE
DONE:		mov		esp,			ebp
			pop		ebp
			ret