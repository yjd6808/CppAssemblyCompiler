; 작성자 : 윤정도
; 작성일 : 2020-01-29 (금)


; 77p. 연습문제 (7)
;
; 다음 팩토리얼 계산 C 코드를 어셈블리 언어로 변환하라.
;
; extern int i, n, fact
;
; void test() 
; {
;     fact = n;
;     for (i = n - 1; i > 0; i--)
;         fact = fact * i;
; }

segment .bss
extern i, n, fact_ret

segment .text
global test
test:
			mov		eax,				[n]
			mov		dword[fact_ret],	eax		;	fact_ret = n

			mov		eax,				[n]
			dec		eax
			mov		dword[i],			eax		;	i = n - 1

FOR_CMP:	cmp		dword[i],			0
			jle		DONE

			mov		eax,				[fact_ret]
			imul	eax,				[i]
			mov		dword[fact_ret],	eax		;	fact_ret = fact_ret * i
			dec		dword[i]					;	i--
			jmp		FOR_CMP

DONE:		ret


