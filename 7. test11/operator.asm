; 작성자 : 윤정도
; 작성일 : 2020-02-06 (토)

; 114p. 연습문제 - 9
; 다음 기능을 하는 어셈블리 코드를 작성하라
; 이 함수는 파라미터가 2진수로 표현했을때 bit가 1인 bit의 갯수가 짝수이면 1을 홀수개이면 0을 반환한다.
; ex) 1100 -> 1반환 / 11001 -> 0 반환

; PF	:	패리티 플래그
; ->	연산결과에 1인 bit 개수가 짝수개이면 1 홀수개이면 0
; lahf 활용
; parity bit는 3번째 비트


segment .text
global isEvenOne
isEvenOne:
			push	ebp
			mov		ebp,		esp

			mov		eax,		[ebp + 8]	;	eax = n
			sub		eax,		0			;	플래그 변화

			lahf
			test	ah,			0b00000100	;	패러티 플래그 켜졌는지 확인
			jnz		PF_ON
			mov		eax,		0
			jmp		DONE

PF_ON:		mov		eax,		1
			jmp		DONE
			
DONE:		mov		esp,		ebp
			pop		ebp
			ret