; 작성자 : 윤정도
; 작성일 : 2020-01-29 (금)


; 76p. 연습문제 (5)
;
; 조건문 다음과 같은 기능흘 하도록 test.asm 파일을 작성하라.
;
; void test() {
;     if (input < 0)
;         output = -input;
;     else if (input == 0)
;         output = 0;
;     else   
;         output = input * input;
; }

segment .bss
extern input, output

segment .text
global test
test:

IF_1:		cmp		dword[input],		0
			jge		ELSE_IF_1						;	if ( input < 0 )
			mov		eax,				[input]
			neg		eax
			mov		dword[output],		eax			;	output = -input
			jmp		DONE

ELSE_IF_1:	cmp		dword[input],		0
			jne		ELSE_1							;	else if ( input == 0 )
			mov		dword[output],		0			;	output = 0
			jmp		DONE

													;	else
ELSE_1:		mov		eax,				[input]		
			imul	eax,				eax
			mov		dword[output],		eax			;	output = input * input
			jmp		DONE

DONE:		ret