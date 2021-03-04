; 작성자 : 윤정도
; 작성일 : 2020-02-06 (토)

; 111p. 연습문제 - 2
; 함수 f()는 레지스터 eax, ebx, ecx, edx 값을 순서대로 스택에 넣은 후(push) 다시 그값을 빼내어 위 순서대로 
; 넣는다(pop). 즉 레지스터 eax, ebx, ecx, edx는 edx, ecx, ebx, eax 레지스터로 옮겨지게 된다. 이렇게 작동하도록
; f() 함수를 어셈블리어로 작성하시오

segment .bss
extern a, b, c, d

segment .text
global f
f:
		push	ebp
		mov		ebp,		esp

		mov		eax,		dword[a]
		mov		ebx,		dword[b]
		mov		ecx,		dword[c]
		mov		edx,		dword[d]

		push	eax
		push	ebx
		push	ecx
		push	edx

		pop		eax
		pop		ebx
		pop		ecx
		pop		edx

		mov		dword[a],	eax
		mov		dword[b],	ebx
		mov		dword[c],	ecx
		mov		dword[d],	edx

		mov		esp,		ebp
		pop		ebp
		ret
		