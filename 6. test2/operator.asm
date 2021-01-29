; 작성자 : 윤정도
; 작성일 : 2020-01-29 (금)

; 예시 코드
; void test_code()
; {
;     if ( score > 90 )
;         grade = 10;
;     else if (score < 60)
;         grade = 0;
;     else
;         grade = 5;
; }


segment .bss
extern grade, score

segment .text
global test
test:

IF_1:		cmp		dword[score],	90
			jle		ELSE_IF_1
			mov		dword[grade],	10
			jmp		DONE

ELSE_IF_1:	cmp		dword[score],	60
			jge		ELSE_1
			mov		dword[grade],	0
			jmp		DONE

ELSE_1:		mov		dword[grade],	5
			jmp		DONE

DONE:		ret