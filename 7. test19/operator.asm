; 작성자 : 윤정도
; 작성일 : 2020-02-07 (일)

; 119p. 연습문제 - 17, 18
; 1) 아래 sum 함수를 어셈블리어로 번역하시오
; 2) sum(4)의 값은 얼마인가?
; 3) sum(4)의 스택높이가 최고가 되었을 때의 내용을 그려라


; ┼───────────────────┼
; │		ebp, esp
; ┼───────────────────┼
; │		ra
; ┼───────────────────┼
; │		n = 1
; ┼───────────────────┼
; │		ebp
; ┼───────────────────┼
; │		ra
; ┼───────────────────┼
; │		n = 2
; ┼───────────────────┼
; │		ebp
; ┼───────────────────┼
; │		ra
; ┼───────────────────┼
; │		n = 3
; ┼───────────────────┼
; │		ebp
; ┼───────────────────┼
; │		ra
; ┼───────────────────┼
; │		n = 4
; ┼───────────────────┼

; int sum(int n)
; {
;     if (n == 0)
;         return 0;
;     return n + sum(n - 1);
; }


segment .text
global sum
sum:
			push	ebp
			mov		ebp,		esp

			mov		eax,		[ebp + 8]
			cmp		eax,		0
			jne		ELSE
			mov		eax,		0
			jmp		DONE
ELSE:		mov		ebx,		[ebp + 8]
			dec		ebx
			push	ebx
			call	sum
			mov		ebx,		[ebp + 8]
			add		ebx,		eax			;	n + sum(n - 1)
			mov		eax,		ebx			;	return n + sum(n - 1)
			jmp		DONE
DONE:		mov		esp,		ebp
			pop		ebp
			ret