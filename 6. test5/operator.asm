; 작성자 : 윤정도
; 작성일 : 2020-01-29 (금)

; 75p. 연습문제 (2)
;
; 다음 명령들이 실행된 후 AL 레지스터의 내용 및 CF, ZF, SF, OF 플래그의 내용은 무엇인가? 그 이유도 설명하라.
; mov      al,     255
; mov      ah,     5
; add      al,     ah
;
; AL = 255 =   1111 1111
; AH =   5 =   0000 0101
; AL +  AH = 1 0000 0100 = 4
;
; -> AL = 4
; -> CF = 1 : MSB에서 올림 발생하였기 때문에 캐리 플래그가 1로 설정된다.
; -> ZF = 0 : 0이 아니므로 제로 플래그는 0이 된다.
; -> SF = 0 : AL 레지스터의 결과 값이 양수 이므로 사인 플래그가 0이 된다.
; -> OF = 0 : 8번째 비트와 7번째 비트가 같기 때문에 오버 플래그가 0이다.

segment .bss
extern _zf, _cf, _sf, _of, ret

segment .text
global check_add
check_add:
	mov		al,		255
	mov		ah,		5
	add		al,		ah

	movsx	eax,	al
	mov		dword[ret],	eax
	ret

global check_2_add
check_2_add:
	mov		ah,		0
	sahf

	mov		al,		120
	mov		ah,		-30
	add		al,		ah
	
	ret

global check_2_sub
check_2_sub:
	mov		ah,		0
	sahf

	mov		al,		120
	mov		ah,		-30
	sub		al,		ah
	movsx	eax,	al
	mov		dword[ret],	eax

	jc		OVER_FLAG_ON_1
	jmp		OVER_FLAG_OFF_1

OVER_FLAG_ON_1:
	mov		dword[_cf],			1
	jmp		DONE_OVER_1
OVER_FLAG_OFF_1:
	mov		dword[_cf],			0
	jmp		DONE_OVER_1

DONE_OVER_1: ret

global check_2_neg
check_2_neg:
	mov		ah,		0
	sahf

	mov		al,		-120
	neg		al
	ret

global check_2_mov
check_2_mov:
	mov		ah,		0
	sahf

	mov		al,		120
	mov		ah,		-30
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