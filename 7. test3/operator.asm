; 작성자 : 윤정도
; 작성일 : 2020-02-06 (토)

; 110p. 연습문제 - 1
; 1 ~ 100까지 자연수를 차례대로 푸쉬하는 프로그램을 작성하라 푸쉬하기 전 ESP 레지스터 값은 전역변수 bottom에 푸시한 후, 
; ESP 값은 전역변수 top에 각각 저장한다.

segment .bss
extern bottom, top, last_value

segment .text
global test
test:
		mov		dword[bottom],		ebp
		mov		eax,				1
WHILE:	cmp		eax,				100
		jg		DONE
		push	eax
		inc		eax
		jmp		WHILE
DONE:	mov		dword[top],			esp
		mov		eax,				[esp]
		mov		dword[last_value],	eax
		add		esp,				400
		ret
