; 작성자 : 윤정도
; 작성일 : 2020-01-31 (일)

; 80p. 연습문제 (14)

; 입력받은 수의 PF(패러티 플래그) 상태를 확인할 수 있도록 코드를 구현하시오

segment .bss
extern n, parity

segment .text
global GetParity
GetParity:
		mov		dword[parity],	0
		mov		eax,			dword[n]
        sub		eax,			0
		lahf
		test    ah,				0b00000100		;	패러티 플래그 and
		jz		DONE
		mov		dword[parity],	1
DONE:	ret
