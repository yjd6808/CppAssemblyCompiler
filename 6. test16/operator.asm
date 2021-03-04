; 작성자 : 윤정도
; 작성일 : 2020-01-31 (일)

; 82p. 연습문제 (15)

; 1 ~ 100사이의 범위에 있는 자연수중 4로 나누었을 때 나머지가 0인 수의 합을 구하는 함수를 어셈블리어로 작성하시오.
; 단 idv, div 명령어를 사용해서는 안됨

; 하위 1, 2번째 비트가 0인경우가 4로 나누었을 때 나머지가 0이다.

segment .bss
extern n, sum, i


segment .text
global test
test:
			mov		dword[sum],		0

			mov		dword[i],		1
FOR_STRAT:	mov		eax,			[i]
			cmp		eax,			[n]
			jge		DONE
			mov		eax,			[i]
			and		eax,			0xfffffffc		;	하위 1, 2번째 비트를 0으로 강제로 만들어줌
			cmp		eax,			[i]				;	하위 1, 2번째 비트가 강제로 변경된 수와 검사하고자하는 수가 같으면 4로 나눴을때 나머지가 0 이다.
			jne		FOR_END
			mov		eax,			[sum]
			add		eax,			[i]
			mov		dword[sum],		eax
FOR_END:	mov		eax,			[i]
			inc		eax
			mov		dword[i],		eax
			jmp		FOR_STRAT
DONE:		ret
