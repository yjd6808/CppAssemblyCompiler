; 작성자 : 윤정도
; 작성일 : 2020-02-07 (일)

; 117p. 연습문제 - 11
; 재귀 함수 : 아래 fact() 함수를 어셈블리어로 변경하라

; int fact(int n)
; {
;     if (n == 1)
;         return 1;
;     else
;         return fact(n - 1) * n;
; }


segment .text
global fact
fact:
				push		ebp
				mov			ebp,			esp

IF:
				mov			eax,			[ebp + 8]		;	eax = n
				cmp			eax,			1
				jne			ELSE
				mov			eax,			1				;	n == 1 && return 1
				jmp			DONE

ELSE			mov			eax,			[ebp + 8]
				dec			eax								;	eax = n - 1
				push		eax
				call		fact
				imul		eax,			[ebp + 8]		;	fact(eax) * n
				jmp			DONE

DONE:			mov			esp,			ebp
				pop			ebp
				ret

