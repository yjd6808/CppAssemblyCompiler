; 작성자 : 윤정도
; 작성일 : 2020-02-07 (일)
; 목적   : 배열과 구조체 학습


segment .data

; 초기화된 배열
global arr
global arr_len

global brr
global brr_len

arr:		dd		1, 2, 3, 4, 5
arr_len:	dd		5

brr:		times	10		dd	1
brr_len:	dd		10

; 지역변수로서의 배열
msg:		db		'%d ',	0

line_sided:	db		10,	'==============', 10, 0
line_left:	db		10,	'==============', 0
line_right:	db		'==============', 10, 0

segment .text
extern printf

; 지역변수로서의 배열
global local_arr_test
local_arr_test:
			push	ebp
			mov		ebp,						esp
			sub		esp,						40
			mov		ecx,						0						;	i = 0

			
L1:			cmp		ecx,						10						;	i < 10 ?
			jge		L2

			mov		[ebp - 40 + 4 * ecx],		ecx						;	arr[i] = i
			mov		ebx,						[ebp - 40 + 4 * ecx]

			push	ecx
			push	ebx
			push	msg
			call	printf
			add		esp,						8
			pop		ecx

			inc		ecx
			jmp		L1

L2:			mov		esp,						ebp
			pop		ebp
			ret


; esi 명령어 사용 - 매개변수 배열 사용   
global esi_param_arr_test
esi_param_arr_test:
		push		ebp
		mov			ebp,		esp
		push		esi

		mov			esi,		[ebp + 8]			;	esi = ebp + 8
		mov			ecx,		0					;	i = 0

L3:		cmp			ecx,		[ebp + 12]			;	i < len ?
		jge			L4								
		
		; mov			[esi],		ecx					;	*esi = i
		; add			esi,		4					;	esi += 4
		lodsd
		
		push		ecx								;	printf 함수 호출시 ecx 레지스터 값이 변경될 수 있으므로 보관
		push		eax
		push		msg
		call		printf
		add			esp,		8
		pop			ecx

		inc			ecx								;	i++
		jmp			L3

L4:		pop			esi
		mov			esp,		ebp
		pop			ebp
		ret

; edi 명령어 사용 - 매개변수 배열 사용   
global edi_param_arr_test
edi_param_arr_test:
		push		ebp
		mov			ebp,		esp
		push		edi

		mov			edi,		[ebp + 8]			;	esi = ebp + 8
		mov			ecx,		0					;	i = 0

L10:	cmp			ecx,		[ebp + 12]			;	i < len ?
		jge			L11
		
		mov			eax,		ecx
		stosd

		inc			ecx								;	i++
		jmp			L10

L11:	pop			edi
		mov			esp,		ebp
		pop			ebp
		ret



; esi, edi, lodsd, stosd 명령어 사용 - 로컬변수 배열 사용
global esi_local_arr_test
esi_local_arr_test:
		push		ebp
		mov			ebp,		esp
		push		esi
		push		edi
		sub			esp,		40					;	int arr[10]

		lea			eax,		[ebp - 48]
		mov			edi,		eax				;	edi = arr
		mov			ecx,		0					;	i = 0

L5:		cmp			ecx,		10					;	i < 10 ?
		jge			L6

		; stosd와 동일
		; mov			[edi],		eax
		; add			edi			4

		mov			eax,		ecx
		stosd										;	*edi = i; edi += 4

		push		ecx								;	printf 함수 호출시 ecx 레지스터 값이 변경될 수 있으므로 보관
		push		eax
		push		msg
		call		printf
		add			esp,		8
		pop			ecx

		inc			ecx
		jmp			L5

L6:		mov			ecx,		0					;	i = 0
		lea			eax,		[ebp - 48]
		mov			esi,		eax					;	esi = arr

		push		line_sided
		call		printf
		add			esp,		4

L7:		cmp			ecx,		10					;	i < 10 ?
		jge			L8

		; lodsd와 동일
		; mov			eax,		[esi]
		; add			esi			4

		lodsd										;	eax = *esi; esi += 4

		push		ecx								;	printf 함수 호출시 ecx 레지스터 값이 변경될 수 있으므로 보관
		push		eax
		push		msg
		call		printf
		add			esp,		8
		pop			ecx

		inc			ecx
		jmp			L7

L8:		
		push		line_sided
		call		printf
		add			esp,		4


		pop			edi
		pop			esi
		mov			esp,		ebp
		pop			ebp
		ret

global direction_flag_local_arr_test
direction_flag_local_arr_test:
		push		ebp
		mov			ebp,		esp
		push		esi
		push		edi
		sub			esp,		40				;	int arr[10]
		cld

		lea			eax,		[ebp - 48]		
		mov			edi,		eax
		mov			ebx,		0				;	i = 0

L13:	cmp			ebx,		10
		jge			L14

		mov			eax,		ebx				;	arr[i] = i
		stosd

		push		ebx
		push		eax
		push		msg
		call		printf
		add			esp,		8
		pop			ebx

		inc			ebx							;	i++
		jmp			L13

L14:	push		line_sided
		call		printf
		add			esp,		4

		mov			ebx,		0				;	i = 0
		lea			eax,		[ebp - 8]
		mov			esi,		eax
		std										;	direction flag = 1 / 내림차순으로 

L15:	cmp			ebx,		10				;	i < 10 ?
		jge			L16

		lodsd									;	direction flag 가 1이기 때문
												;	eax = *esi, esi -= 4 연산 수행

		cld										;	printf 함수 오작동 방지를 위해 direction flag = 0
		push		ebx
		push		eax
		push		msg
		call		printf
		add			esp,		8
		pop			ebx
		std										;	다시 direction flag = 1로 세팅

		inc			ebx
		jmp			L15

L16:	cld										;	direction flag = 0 기존 값으로 복원
		pop			edi
		pop			esi
		mov			esp,		ebp
		pop			ebp
		ret


global direction_flag_param_arr_test
direction_flag_param_arr_test:
		push		ebp
		mov			ebp,		esp

		mov			ebx,		0				;	i = 0
		mov			eax,		[esp + 8]		;	eax = arr
		lea			eax,		[eax + 36]		;	eax = &arr[9]
		mov			esi,		eax				;	esi = &arr[9]
		std

W_1		cmp			ebx,		10				;	i < 10 ?
		jge			W_E_1

		lodsd

		cld
		push		ebx
		push		eax
		push		msg
		call		printf
		add			esp,		8
		pop			ebx
		std

		inc			ebx
		jmp			W_1

W_E_1:	cld
		mov			esp,		ebp
		pop			ebp