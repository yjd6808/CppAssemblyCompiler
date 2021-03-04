; 작성자 : 윤정도
; 작성일 : 2020-02-07 (일)

; 117p. 연습문제 - 13
; 1) 아래 C 프로그램을 전체를 어셈블리어로 번역하시오

; int max(int a, int b)
; {
;     if (a > b)
;         return a;
;     return b;
; }

segment .text
global max
max:
			push	ebp
			mov		ebp,		esp

			mov		eax,		[ebp + 8]

			cmp		eax,		[ebp + 12]
			jle		ELSE
			mov		eax,		[ebp + 8]
			jmp		DONE
ELSE:		mov		eax,		[ebp + 12]
			jmp		DONE
DONE:		mov		esp,		ebp
			pop		ebp
			ret