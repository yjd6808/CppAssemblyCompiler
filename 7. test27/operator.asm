; 작성자 : 윤정도
; 작성일 : 2020-02-07 (일)

; 121p. 연습문제 - 27
; 1) 다음 C 프로그램을 NASM 어셈블리어로 작성하시오
; 2) 이 때 f(5)의 값은 얼마인가?

; 배열의 엘리먼트들의 총합을 계산하는 함수인듯?

; int a[] = { 0, 1, 0, 1, 0, 1, 0, 1};

; int f(int n)
; {
;     if (n == 0)
;         return 0;
;     return f(n - 1) + a[n - 1];
; }

segment .bss
extern a


segment .text
global f
f:
            push    ebp
            mov     ebp,        esp

			mov		eax,		[ebp + 8];
			cmp		eax,		0
			jne		ELSE
			mov		eax,		0
			jmp		DONE

ELSE:		mov		ebx,		[ebp + 8]
			dec		ebx,						;	n - 1
			push	ebx	
			call	f							;	f(n - 1)
			mov		ebx,		[ebp + 8]
			dec		ebx							;	n - 1
			add		eax,		[a + 4 * ebx]	;	f(n - 1) + a[n - 1]
			jmp		DONE

DONE:		mov		esp,		ebp
			pop		ebp
            ret