; 작성자 : 윤정도
; 작성일 : 2020-02-06 (토)

; 112p. 연습문제 - 6
; 113p. 연습문제 - 7

; 파라미터를 가진 함수 max()는 인수 a, b를 비교하여 그 중 큰 값을 result라는 전역변수에 저장한다.
; max 함수를 NASM 어셈블리어 언어로 구현하라

; extern int result;

; void max(int a, int b)
; {
;     int m;
;     if (a > b)
;         m = a;
;     else
;         m = b;
;     result = m;    
; }

segment .bss
extern result

segment .text
global max
max:
		push	ebp
		mov		ebp,			esp
		sub		esp,			4				;	지역변수 m의 공간 확보

		mov		eax,			[ebp + 12]		;	eax = a
		cmp		eax,			[ebp + 8]
		jl		ELSE				
		mov		eax,			[ebp + 12]		;	a >= b인 경우
		mov		[ebp - 4],		eax
		mov		dword[result],	eax
		jmp		DONE

ELSE:	mov		eax,			[ebp + 8]		;	a < b인 경우
		mov		[ebp - 4],		eax
		mov		dword[result],	eax

DONE:	mov		esp,			ebp
		pop		ebp

		ret