; 작성자 : 윤정도
; 작성일 : 2020-02-06 (토)

; 111p. 연습문제 - 5
; 다음 C언어의 f() 함수를 어셈블리어로 나타내면 다음과 같다. 빈칸을 채우시오.

; extern int a, b, c;
; int f(int x) 
; {
;     return a * x * x + b * x + c;
; }

; (1)
; ==========================
segment .bss
extern a, b, c
; ==========================

segment .text
global f
f:
		push	ebp
		mov		ebp,		esp

		mov		eax,		dword[a]
		; (2)
		; ==========================
		mov		ecx,		[ebp + 8]			
		imul	eax,		ecx					
		imul	eax,		ecx					;	eax = a * x * x
		; ==========================

		mov		ecx,		eax
		mov		eax,		dword[b]

		; (3)
		; ==========================
		mov		ebx,		[ebp + 8]
		imul	eax,		ebx					;	eax = b * x
		; ==========================

		add		ecx,		eax					;	a * x * x + b * x

		; (4)
		; ==========================
		add		ecx,		dword[c]			;	a * x * x + b * x + c
		; ==========================
		mov		eax,		ecx

		mov		esp,		ebp
		pop		ebp
		ret