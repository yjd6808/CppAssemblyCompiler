; 작성자 : 윤정도
; 작성일 : 2020-01-25 (월)

; 1. 다음 연산을 계산하는 어셈블리 코드를 작성하시오
; value = value * 21을 구현하시오. 
; 참고) value는 unsigned 형임

; 1) mul 명령어를 사용하여 구현하시오
; 2) shift와 add 명령어를 사용하여 구현하시오

; 2. eax 레지스터에 35를 곱해서 그 결과를 eax 레지스터 저장하는 코드를 작성하시오


segment .bss
extern value

segment .text
global mul_test
mul_test:
    mov     eax,            [value]
    mov     ecx,            21

    mul     ecx
    mov     dword[value],   eax

    ret

global shift_add_test
shift_add_test:
    mov     ebx,              [value]

    mov     eax,              ebx
    sal     eax,              4
    add     dword[value],     eax

    mov     eax,              ebx
    sal     eax,              2
    add     dword[value],     eax

    ret

global shift_add_test_2
shift_add_test_2:    
    mov     ebx,              [value]

    ; 35곱하기 연산을 쉬프트 연산을 사용해서 해결
    mov     eax,              ebx
    sal     eax,              5
    add     dword[value],     eax

    mov     eax,              ebx
    sal     eax,              1
    add     dword[value],     eax

    ret