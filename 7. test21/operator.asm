; 작성자 : 윤정도
; 작성일 : 2020-02-07 (일)

; 120p. 연습문제 - 20
; 1) 아래 subtract 함수를 어셈블리어로 번역하시오.
; 캐리 플래그 : MSB에서 올림 또는 내림이 발생하는 경우, 즉 unsigned overflow 발생시 1로 세팅된다.
; 플래그 레지스터의 0번째 비트이다.

; extern int cf;
; int subtract(int a, int b)
; {
;     ; 뺄셈 결과의 캐리 플래그 내용을 cf에 저장
;     return a - b;
; }

segment .bss
extern _cf

segment .text
global subtract
subtract:
			push		ebp
			mov			ebp,		esp

			mov			dword[_cf],	0

			mov			eax,		[ebp + 8]
			sub			eax,		[ebp + 12]
			mov			ebx,		eax				;	뺀 결과 임시 보관

			lahf
			test		ah,			0b00000001
			jnz			CF_SET
			mov			dword[_cf],	0
			jmp			DONE
CF_SET:		mov			dword[_cf],	1
			jmp			DONE
DONE:		mov			eax,		ebx
			mov			esp,		ebp
			pop			ebp
			ret