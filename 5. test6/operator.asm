; 작성자 : 윤정도
; 작성일 : 2020-01-24 (일)

; 비트 확장과 비트 축소 관련문제이다.
; 1) 1바이트 문자형 변수 c = 10일때 이를 비트 확장하여 s = 10, i = 10이 되도록하라
; 2) 1바이트 문자형 변수 c = -10일때 이를 비트 확장하여 s = -10, i = -10이 되도록하라
; 3) 4바이트 정수형 변수 i = 100일때 이를 비트 축소하여 s = 100, c = 100이 되도록하라
; 3) 4바이트 정수형 변수 i = -100일때 이를 비트 축소하여 s = -100, c = -100이 되도록하라

segment .bss
extern c
extern s
extern i


segment .text
global increate_type_casting
increate_type_casting:
    mov         al,         [c]
    cbw
    mov         word[s],    ax
	cwde
	mov			dword[i],	eax

    ret

global decrease_type_casting
decrease_type_casting:
	mov			eax,		[i]
	mov			word[s],	ax
	mov			byte[c],	al
    ret
