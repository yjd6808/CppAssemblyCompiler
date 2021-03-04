; 작성자 : 윤정도
; 작성일 : 2020-02-04 (목)

; 101p. 7.7.3 실습

; int max(int a, int b)
; {
;     if (a > b)
;         return a
;     else
;         return b
; }

; 위의 max 함수를 어셈블리어로 구현하시오

segment .bss
extern result, esp_a, esp_b


segment .text
global max
max:
			push	ebp
			mov		ebp,			esp			;	함수 프롤로그

			mov		eax,			[ebp + 8]	;	a
			mov		dword[esp_a],	eax			;	esp_a = a
			mov		ebx,			[ebp + 12]	;	b
			mov		dword[esp_b],	ebx			;	esp_b = b

IF_1:		cmp		eax,			ebx
			jge		ELSE_1
			mov		eax,			ebx			;	반환값 지정
			jmp		EPILOGUE
ELSE_1:		jmp		EPILOGUE					;	이미 eax 레지스터에 반환값이 지정되어 있기 때문에 바로 반환해주면 됨 - 없어도 되는 줄이지만 일단 ELSE 
EPILOGUE:	mov		esp,			ebp			;	함수 에필로그
			pop		ebp
			ret