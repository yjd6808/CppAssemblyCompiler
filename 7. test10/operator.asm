; 작성자 : 윤정도
; 작성일 : 2020-02-06 (토)

; 118p. 연습문제 - 8
; 다음 C함수를 어셈블리어로 변경하라


; 1) 2차 함수
; int f(int x)
; {
;     return x * x + 2 * x + 3;
; }

; 2) 조건문
; int check(int input)
; {
;     if (input < 0)
;         return -input;
;     else if (input == 0)
;         return 0;
;     else
;         return input * input;
; }

; 3) 반복문
; int fact(int n)
; {
;     int i, 
;     int f = n;

;     for (i = n - 1; i > 0; i--)
;         f = f * i;
;     return f;
; }

; 4) 1의 개수 구하기
; int ones(int n)
; {
;     return n의 비트중 1의 갯수 반환
; }


; 5) 홀수와 짝수
; int isOdd(int n)
; {
;     return 홀수이면 1 짝수이면 0 반환
;}

segment .text

; 1) 2차 함수
global f
f:
		push	ebp
		mov		ebp,		esp

		mov		eax,		[ebp + 8]	;	x
		imul	eax,		eax			;	x * x

		mov		ecx,		eax
		mov		eax,		2
		imul	eax,		[ebp + 8]	;	2 * x

		add		ecx,		eax			;	x * x + 2 * x
		add		ecx,		3			;	x * x + 2 * x + 3

		mov		eax,		ecx

		mov		esp,		ebp
		pop		ebp
		ret

; 2) 조건문
global check
check:
			push	ebp
			mov		ebp,		esp

			mov		eax,		[ebp + 8]
			cmp		eax,		0
			jge		ELSE_IF_1
			neg		eax						;	eax = -eax
			jmp		DONE_1
ELSE_IF_1:	cmp		eax,		0
			jne		ELSE_1
			mov		eax,		0			;	eax = 0
			jmp		DONE_1
ELSE_1:		imul	eax,		eax			;	eax = eax * eax
			jmp		DONE_1
DONE_1:		mov		esp,		ebp
			pop		ebp
			ret

; 3) 반복문
global fact
fact:
		push	ebp
		mov		ebp,		esp

		mov		eax,		[ebp + 8]		;	eax = n
		mov		[ebp - 4],	eax				;	f = n

		mov		eax,		[ebp + 8]		;	eax = n
		dec		eax							;	eax--
		mov		[ebp - 8],	eax				;	i = n - 1

FOR_2:	mov		eax,		[ebp - 8]		;	eax = i
		cmp		eax,		0		
		jle		DONE_2
		mov		eax,		[ebp - 4]		;	eax = f
		mov		ebx,		[ebp - 8]		;	ebx = i
		imul	eax,		ebx				;	eax = f * i
		mov		[ebp - 4],	eax				;	f = eax

		dec		ebx							;	ebx--
		mov		[ebp - 8],	ebx				;	i = ebx
		jmp		FOR_2
DONE_2:	mov		eax,		[ebp - 4]
		mov		esp,		ebp
		pop		ebp
		ret

; 4) 1의 개수 구하기
global ones
ones:
			push	ebp
			mov		ebp,		esp

			mov		eax,		0
			mov		[ebp - 4],	eax			; 	i = 0
			
			mov		eax,		0
			mov		[ebp - 8],	eax			;	1 bit count = 0
			
FOR_3:		mov		eax,		[ebp - 4]	;	eax = i
			cmp		eax,		31
			jg		DONE_3
											;	i < 32
			mov		ebx,		[ebp + 8]	;	ebx = n
			mov		eax,		1			;	eax = 1

			mov		ecx,		[ebp - 4]	;	ecx = i
			sal		eax,		cl			;	eax <<= i sal은 8비트 상수 또는 cl레지스터만 사용가능

IF_3:		test	eax,		[ebp + 8]
			jz		IF_DONE_3
			mov		eax,		[ebp - 8]	;	eax = 1 bit count
			inc		eax
			mov		[ebp - 8],	eax			;	1 bit count ++

IF_DONE_3:	mov		eax,		[ebp - 4]	;	eax = i
			inc		eax						;	eax++
			mov		[ebp - 4],	eax			;	i = eax
			jmp		FOR_3
DONE_3:		mov		eax,		[ebp - 8]	;	return 1 bit count
			mov		esp,		ebp
			pop		ebp
			ret

global isOdd
isOdd:
			push	ebp
			mov		ebp,		esp

			mov		eax,		[ebp + 8]		;	eax = n
			mov		ebx,		0
			mov		[ebp - 4],	ebx				;	is odd = 0
			test	eax,		1				
			jnz		ELSE_4
			mov		eax,		0				;	짝수라면 0
			jmp		DONE_4
ELSE_4		mov		eax,		1				;	홀수라면 1
			jmp		DONE_4
DONE_4		mov		esp,		ebp
			pop		ebp
			ret