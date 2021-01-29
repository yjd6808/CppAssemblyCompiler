; 작성자 : 윤정도
; 작성일 : 2020-01-27 (수)

; 실습 : 연산을 수행해서 CF, ZF, SF, OF 플래그들의 변화를 확인하시오.

segment .data
sf_bit_mask      dw		0b0000000010000000
sf_bit_shift	 db		7

of_bit_mask      dw		0b0000010000000000
of_bit_shift	 db		10

zf_bit_mask      dw		0b0000000001000000
zf_bit_shift	 db		6

cf_bit_mask      dw		0b0000000000000001
cf_bit_shift	 db		0

pf_bit_mask      dw		0b0000000000000100
pf_bit_shift	 db		2

af_bit_mask      dw		0b0000000000010000
af_bit_shift	 db		4

segment .bss
extern a, b, p, q
extern _sf, _zf, _of, _cf, _pf, _af

segment .text

global add_test
add_test:
	mov		eax,		[a]
	mov		ebx,		[b]
	add		eax,		ebx
	mov		dword[p],	eax

    ret

global sub_test
sub_test:
	mov		eax,		[a]
	mov		ebx,		[b]
	sub		eax,		ebx
	mov		dword[p],	eax

    ret

global mul_test
mul_test:
	mov		eax,		[a]
	mov		ebx,		[b]
	imul	eax,		ebx
	mov		dword[p],	eax

    ret

global div_test
div_test:
	mov		eax,		[a]
	mov		ebx,		[b]
	idiv	ebx
	cdq

	mov		dword[p],	eax
	mov		dword[q],	edx

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