; 작성자 : 윤정도
; 작성일 : 2020-01-29 (금)

; 75p. 연습문제 (1)
;
; AL 레지스터에는 1, AH 에는 -1이 들어있다. 다음 명령어를 실행하면 AL 레지스터의 값은 어떻게 변경되는가?
; 또한 CF, ZF, SF, OF 플래그 값은 어떻게 변경되는가?
;
; 머리속으로 풀어봄
; 1) add al, ah
; -> al = 0
; -> CF = 1, ZF = 1, SF = 0, OF = 0
; 2) xor al, al
; -> al = 0
; -> CF = 0, ZF = 1, SF = 0, OF = 0
; 3) mov al, ah
; -> al = -1
; -> CF = 0, ZF = 0, SF = 1, OF = 0
; -> CF = 0, ZF = 0, SF = 1, OF = 0
 ;-> mov 연산시에는 플래그 값이 변경되지 않는다 따라서 모든 CF, ZF, SF, OF 모두 0이다.

segment .bss
extern _zf, _cf, _sf, _of

segment .text
global check_add
check_add:
	mov		al,		1
	mov		ah,		-1
	add		al,		ah
	ret

global check_xor
check_xor:
	mov		al,		1
	mov		ah,		-1
	xor		al,		al
	ret

global check_mov
check_mov:
	mov		al,		1
	mov		ah,		-1
	mov		al,		ah
	ret

global check_flags
check_flags:
	jc		CARRY_FLAG_ON
	jmp		CARRY_FLAG_OFF
CARRY_FLAG_ON:
	mov		dword[_cf],			1
	jmp		DONE_CARRY
CARRY_FLAG_OFF:
	mov		dword[_cf],			0
	jmp		DONE_CARRY
; ========================================
DONE_CARRY:
	jz		ZERO_FLAG_ON
	jmp		ZERO_FLAG_OFF

ZERO_FLAG_ON:
	mov		dword[_zf],			1
	jmp		DONE_ZERO
ZERO_FLAG_OFF:
	mov		dword[_zf],			0
	jmp		DONE_ZERO
; ========================================
DONE_ZERO:
	jo		OVER_FLAG_ON
	jmp		OVER_FLAG_OFF

OVER_FLAG_ON:
	mov		dword[_of],			1
	jmp		DONE_OVER
OVER_FLAG_OFF:
	mov		dword[_of],			0
	jmp		DONE_OVER

; ========================================
DONE_OVER:
	js		SIGN_FLAG_ON
	jmp		SIGN_FLAG_OFF

SIGN_FLAG_ON:
	mov		dword[_sf],			1
	jmp		DONE_SIGN
SIGN_FLAG_OFF:
	mov		dword[_sf],			0
	jmp		DONE_SIGN

; ========================================
DONE_SIGN:
	ret