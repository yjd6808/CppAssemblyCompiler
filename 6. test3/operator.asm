; 작성자 : 윤정도
; 작성일 : 2020-01-29 (금)

; 실습
; 외부 전역변수 num을 1부터 num까지 자연수의 합을 계산하여 외부 전역변수 sum에 그 값을 저장하는 기능을 하는
; test함수를 어셈블리어로 작성하시오

segment	.data
idx		dd		1

segment .bss
extern num, sum

segment .text
global test
test:
				mov		dword[idx],		1
				mov		dword[sum],		0
				jmp		WHILE_START_1

WHILE_START_1:	mov		eax,			dword[num]
				cmp		dword[idx],		eax	
				jg		WHILE_END_1						;	while (idx <= num)

				mov		eax,			dword[sum]
				add		eax,			dword[idx]
				mov		dword[sum],		eax				;	sum += idx
				inc		dword[idx]						;	idx++
				jmp		WHILE_START_1

WHILE_END_1:	ret