; 작성자 : 윤정도
; 작성일 : 2020-02-06 (토)

; C 함수를 어셈블리에서 호출

segment .text
extern ret
extern func

global test
test:
		call 	func
		mov		dword[ret],		eax
		ret
		