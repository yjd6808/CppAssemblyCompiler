; 작성자 : 윤정도
; 작성일 : 2020-02-06 (토)

; 115p. 연습문제 - 10
; 비트 마스킹 : 다음 기능을 하는 함수를 어셈블리어로 작성하시오
; 다음 함수는 파라미터 num을 이진수로 나타내었을 때 b0 번째 비트를 0으로 b1번째 비트를 1로 만든다.


segment .text
global setBits
setBits:
			push	ebp
			mov		ebp,		esp

			mov		eax,		[ebp + 8]
			mov		[ebp - 4],	eax			;	bitMaskedNumber = 비트 마스킹 되어 변경된 수 = n

			mov		eax,		1			;	eax = 1
			mov		ecx,		[ebp + 12]	;	ecx = b0
			shl		eax,		cl			;	eax <<= b0
			xor		eax,		0xffffffff	;	eax ^= 0xffffffff
			mov		ebx,		[ebp - 4]	;	ebx = bitMaskedNumber
			and		ebx,		eax			;	ebx &= eax
			mov		[ebp - 4],	ebx			;	bitMaskedNumber = ebx

			mov		eax,		1			;	eax = 1
			mov		ecx,		[ebp + 16]	;	ecx = b1
			shl		eax,		cl			;	eax <<= b1
			mov		ebx,		[ebp - 4]	;	ebx = bitMaskedNumber
			or		ebx,		eax			;	ebx |= eax
			mov		[ebp - 4],	ebx			;	bitMaskedNumber = ebx

			mov		eax,		[ebp - 4]

			mov		esp,		ebp
			pop		ebp
			ret