; 작성자 : 윤정도
; 작성일 : 2020-02-07 (일)

; 120p. 연습문제 - 22
; 아래 negate(char c) 함수는 파리미터 c에 대한 2의 보수를 반환한다.
; 결과로 변경되는 오버 플래그는 전역변수 of에 저장한다.

; int _of;
; char negate(char c)
; {
;     ; of = 2의 보수 연산 후 오버 플래그값 저장
;     return -c;
; }

segment .bss
extern _of

segment .text
global negate
negate:
			push		ebp
			mov			ebp,		esp

			mov			dword[_of],	0

			mov			al,			[ebp + 8]
			neg			al
			jo			OF_SET
			mov			dword[_of],	0
			jmp			DONE
OF_SET:		mov			dword[_of],	1
			jmp			DONE
DONE:		mov			esp,		ebp
			pop			ebp
			ret