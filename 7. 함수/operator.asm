; 작성자 : 윤정도
; 작성일 : 2020-01-27 (수)
; 목적   : 비교와 반복 학습

segment .bss

; push pop 명령어 변수
extern a, b, c, pop_a, pop_b, pop_c
extern current_stack_pos
extern esp_a, esp_b, esp_c, esp_pop_c, esp_pop_b, esp_pop_a
extern esp_d, esp_e, esp_f, esp_g, esp_h

; call ret 명령어 변수
extern ct_ra, ct_rb, ct_rc, ct_sa, ct_sb, ct_sc

; 매개변수 변수
extern result

; ebp 명령어 변수
extern ebp_a, ebp_b, ebp_c, ebp_d, ebp_e, ebp_f

segment .text

; push pop 명령어
global push_pop_test
push_pop_test:
    mov     dword[current_stack_pos],   esp

    mov     eax,                        10
    push    eax
    mov     dword[a],                   eax
    mov     dword[esp_a],               esp

    mov     eax,                        20
    push    eax
    mov     dword[b],                   eax
    mov     dword[esp_b],               esp

    mov     eax,                        30
    push    eax
    mov     dword[c],                   eax
    mov     dword[esp_c],               esp

    pop     dword[pop_c]
    mov     dword[esp_pop_c],           esp

    pop     dword[pop_b]
    mov     dword[esp_pop_b],           esp

    pop     dword[pop_a]
    mov     dword[esp_pop_a],           esp

    ret

; call ret 명령어
global ct_main
ct_main:
		call	ct_a
		mov		dword[ct_ra],		esp
		ret

global ct_a
ct_a:
		mov		dword[ct_rb],		esp
		ret

global ct_b
ct_b:
		mov		dword[ct_sb],		esp
		call	ct_c
		mov		dword[ct_rc],		esp
		ret

global ct_c
ct_c:
		mov		dword[ct_sc],		esp
		ret

; 매개변수
global add
add:
		mov		eax,				[esp + 4]			; eax = 3
		add		eax,				[esp + 8]			; eax = eax + 4
		mov		dword[result],		eax
		ret

global asm_add
asm_add:
		mov		dword[esp_a],			esp
														; esp : 100
		push	10										; esp : 96
		mov		dword[esp_b],			esp
		push	20										; esp : 92
		mov		dword[esp_c],			esp

		call	asm_sub_with_params						

		pop		eax
		mov		dword[esp_d],			esp
		pop		eax
		mov		dword[esp_e],			esp
		ret

asm_sub_with_params:
		mov		eax,				[esp + 8]
		sub		eax,				[esp + 4]
		mov		dword[result],		eax
		ret

; ebp 명령어
; 여기 적힌 esp, ebp 수치는 임시로 적은 수치임
global ebp_test
ebp_test:
		; 초기화
		push	ebp
		
		mov		dword[ebp_a],		0
		mov		dword[ebp_b],		0
		mov		dword[ebp_c],		0
		mov		dword[ebp_d],		0
		mov		dword[ebp_e],		0

		mov		ebp,				esp				; esp = 100, ebp = 100
		mov		dword[ebp_d],		esp
		push	10									; esp = 96
		push	20									; esp = 92
		push	30									; esp = 88

		mov		eax,				[ebp - 4]
		mov		dword[ebp_a],		eax
		mov		eax,				[ebp - 8]
		mov		dword[ebp_b],		eax
		mov		eax,				[ebp - 12]
		mov		dword[ebp_c],		eax

		call	ebp_test_2

		pop		eax
		pop		eax
		pop		eax

		mov		esp,				ebp				; esp = 100
		pop		ebp
		ret

ebp_test_2:
		mov		dword[ebp_e],		esp
		ret