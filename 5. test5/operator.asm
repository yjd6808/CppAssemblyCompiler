; 작성자 : 윤정도
; 작성일 : 2020-01-24 (일)

; n의값을 읽고 짝수인지 홀수인지 판별하는 프로그램을 작성하라


segment .bss
extern iNumber

global  iResult
iResult      resd    1


segment .text
global test
test:
    mov     eax,                [iNumber]
    and     eax,                0x1
    mov     dword[iResult],     eax

    ret
