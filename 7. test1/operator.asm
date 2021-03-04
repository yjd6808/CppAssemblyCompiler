; 작성자 : 윤정도
; 작성일 : 2020-02-03 (수)

; 93p. 7.5.4 실습

; void max(int a, int b)
; {
;     int m;

;     if (a > b)
;         m = a;
;     else
;         m = b;
;     result = m;
; }

; 위의 max 함수를 어셈블리어로 구현하시오

segment .bss
extern result, esp_a, esp_b


segment .text
global max
max:
			sub		esp,			4
			mov		eax,			[esp + 8]		; 3
			mov		dword[esp_a],	eax

			mov		eax,			[esp + 12]		; 4
			mov		dword[esp_b],	eax

			mov		eax,			[esp + 12]		; m 
			cmp		eax,			[esp + 8]		; m과 n을 비교
			jl		ELSE
			mov		eax,			[esp + 12]
			mov		[esp],			eax
			mov		dword[result],	eax
			add		esp,			4
			jmp		DONE
ELSE:		mov		eax,			[esp + 8]
			mov		[esp],			eax
			mov		dword[result],	eax
			add		esp,			4
DONE:		ret