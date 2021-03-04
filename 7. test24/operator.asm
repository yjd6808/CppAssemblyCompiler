; 작성자 : 윤정도
; 작성일 : 2020-02-07 (일)

; 121p. 연습문제 - 24
; 함수 log2(int n)은 n이 2의 몇승인지 반환해준다. 해당 기능을 하는 함수를 어셈블리어로 작성하시오
; ex) log2(16) = 4
; ex) log2(256) = 8
; 힌트) n을 k회 우측 쉬프트 하면 n % 2의k승이 된다.

segment .text
global log2
log2:
			push		ebp
			mov			ebp,		esp
			sub			esp,		8

			mov			eax,		0			
			mov			[ebp - 4],	eax			;	shift_count = 우측 이동 횟수 = 0

			mov			eax,		[ebp + 8]
			mov			[ebp - 8],	eax			;	shift_num = 이동중인 숫자 = n

WHILE:		mov			eax,		[ebp - 8]
			cmp			eax,		0
			je			DONE

			mov			eax,		[ebp - 8]
			sar			eax,		1
			mov			[ebp - 8],	eax			;	shift_num >>= 1

			mov			eax,		[ebp - 4]	
			inc			eax
			mov			[ebp - 4],	eax			;	shift_count++

			jmp			WHILE
DONE:		mov			eax,		[ebp - 4]
			dec			eax
			mov			esp,		ebp
			pop			ebp
			ret