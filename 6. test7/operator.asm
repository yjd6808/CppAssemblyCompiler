; 작성자 : 윤정도
; 작성일 : 2020-01-29 (금)


; 76p. 연습문제 (6)
;
; 다음 C 코드를 어셈블리 언어로 변환하라. 단, 변수 n은 EAX 레지스터에 해당한다.
;
; while ( n < 100 )
;     n++;

segment .bss
extern ret

segment .text
global test
test:
			mov		eax,		0		; 초기화

WHILE:		cmp		eax,		100
			jge		WHILE_END
			inc		eax
			mov		dword[ret],	eax
			jmp		WHILE
	
WHILE_END:	ret

