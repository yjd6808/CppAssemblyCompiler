; 작성자 : 윤정도
; 작성일 : 2020-01-22 (금)
; 목적   : 비트 이동 학습

segment .bss
extern iValue_1
extern iValue_2
extern iValue_3
extern iValue_4

extern sValue_1
extern sValue_2
extern sValue_3
extern sValue_4

extern cValue_1
extern cValue_2
extern cValue_3
extern cValue_4

segment .text

; ===== bit shift

global left_shift
left_shift:
    mov     dword[iValue_1],     1
    shl     dword[iValue_1],     2

    ret

global right_shift
right_shift:
    mov     dword[iValue_1],     4
    shr     dword[iValue_1],     2

    ret

global logical_shift
logical_shift:
    mov     byte[cValue_1],     -32
    mov     byte[cValue_2],     -32
    shr     byte[cValue_2],     2

    ret
    
    
global arithmetic_shift
arithmetic_shift:
    mov     byte[cValue_1],     -32
    mov     byte[cValue_2],     -32
    sar     byte[cValue_2],     2

    ret

; ===== logical operations

global and_operation
and_operation:
    mov     al,    12
    mov     bl,    10
    and     al,    bl
    mov     byte[cValue_1],     al     ;   cValue_1 = 12 & 10

    ret

global or_operation
or_operation:
    mov     al,    12
    mov     bl,    10
    or      al,    bl
    mov     byte[cValue_1],     al     ;   cValue_1 = 12 | 10
    
    ret

global xor_operation
xor_operation:
    mov     al,    12
    mov     bl,    10
    xor     al,    bl
    mov     byte[cValue_1],     al     ;   cValue_1 = 12 ^ 10
    
    ret

global not_operation
not_operation:
    mov     byte[cValue_1],     10
    not     byte[cValue_1]              ;   cValue_1 = ~cValue_1

    ret

; ===== bit masking

global LSB_to_1
LSB_to_1:
    mov     byte[cValue_1],     10
    or      byte[cValue_1],     0x01

    ret

; 맨오른쪽 비트만 0으로 바꾸기 - 산술 비트 이동을 사용하여 최상위비트는 바뀌지 않도록함
global LSB_to_0
LSB_to_0:
    mov     byte[cValue_1],     11      ;   0000 1011
    sar     byte[cValue_1],     1       ;   0000 0101
    sal     byte[cValue_1],     1       ;   0000 1010

    ret

global MSB_to_1
MSB_to_1:
     mov     byte[cValue_1],     11      ;   0000 1011
     or      byte[cValue_1],     0x80    ;   0000 1011 | 1000 0000

    ret

global MSB_to_0
MSB_to_0:
    mov     byte[cValue_1],     -117    ;   1000 1011 (-117)
    shl     byte[cValue_1],     1       ;   0001 0110
    shr     byte[cValue_1],     1       ;   0000 1011
    
    ret

; ===== endian
global check_processor_endian
check_processor_endian:
	mov		al,					[iValue_1 + 0]
	mov		byte[cValue_1],		al

	mov		al,					[iValue_1 + 1]
	mov		byte[cValue_2],		al

	mov		al,					[iValue_1 + 2]
	mov		byte[cValue_3],		al

	mov		al,					[iValue_1 + 3]
	mov		byte[cValue_4],		al

	ret


; ===== data type conversion
global check_cbw_init
check_cbw_init:
	mov		ax,					0

	mov		byte[cValue_3],		al			;	cValue_3 = 0
	mov		byte[cValue_4],		ah			;	cValue_3 = 0

	ret

global check_cbw
check_cbw:
	
	mov		al,					[cValue_1]
	cbw

	mov		byte[cValue_3],		al
	mov		byte[cValue_4],		ah

	mov		word[sValue_1],		ax

	ret


global check_cwd_init
check_cwd_init:
	mov		ax,					0
	mov		dx,					0

	mov		word[sValue_3],		ax
	mov		word[sValue_4],		dx

	ret

global check_cwd
check_cwd:
	mov		ax,					[sValue_1]
	cwd

	mov		word[sValue_3],		ax
	mov		word[sValue_4],		dx

	ret

global check_cwde_init
check_cwde_init:
	mov		eax,				0
	mov		dword[iValue_2],	eax
	ret

global check_cwde
check_cwde:
	mov		ax,					[sValue_1]
	cwde

	mov		dword[iValue_1],	eax

	ret

global check_movsx_init
check_movsx_init:
	ret

global check_movsx
check_movsx:
	movsx	ax,					byte[cValue_1]
	mov		word[sValue_1],		ax					;	sValue_1 = (short)cValue_1

	movsx	eax,				word[sValue_1]
	mov		dword[iValue_1],	eax					;	sValue_1 = (int)sValue_1

	ret

global check_movzx_init
check_movzx_init:
	ret

global check_movzx
check_movzx:
	movzx	ax,					byte[cValue_1]
	mov		word[sValue_1],		ax					;	sValue_1 = (short)cValue_1

	movzx	eax,				word[sValue_1]
	mov		dword[iValue_1],	eax					;	sValue_1 = (int)sValue_1

	ret

; ===== bit circulation

global check_rol
check_rol:
	rol		byte[cValue_1],		1					;	비트씩 왼쪽으로 밀기 MSB의 비트는 LSB로 이동

	ret

global check_ror
check_ror:
	ror		byte[cValue_1],		1					;	비트씩 오른쪽으로 밀기 LSB의 비트는 MSB로 이동

	ret



global check_cf_on_rcl
check_cf_on_rcl:
	stc												;	Carry Flag = 1
	rcl		byte[cValue_1],		1					;	비트씩 왼쪽으로 밀기 MSB의 비트는 LSB로 이동, 회전한 비트는 1로 세팅

	ret

global check_cf_off_rcl
check_cf_off_rcl:
	clc												;	Carry Flag = 0
	rcl		byte[cValue_1],		1					;	비트씩 왼쪽으로 밀기 MSB의 비트는 LSB로 이동, 회전한 비트는 0로 세팅

	ret

global check_cf_on_rcr
check_cf_on_rcr:
	stc												;	Carry Flag = 1
	rcr		byte[cValue_1],		1					;	비트씩 왼쪽으로 밀기 MSB의 비트는 LSB로 이동, 회전한 비트는 1로 세팅

	ret

global check_cf_off_rcr
check_cf_off_rcr:
	clc												;	Carry Flag = 0
	rcr		byte[cValue_1],		1					;	비트씩 왼쪽으로 밀기 MSB의 비트는 LSB로 이동, 회전한 비트는 0로 세팅
	
	ret
