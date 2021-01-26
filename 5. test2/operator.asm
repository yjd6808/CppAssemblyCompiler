; 작성자 : 윤정도
; 작성일 : 2020-01-24 (일)

; 보수연산 문제
; 1) 16비트 정수형 16진수 0xC2A5를 십진수로 나타내어라.
; 2) 16비트 정수형 16진수 0xC2A5의 1의 보수를 구하자


segment .bss
extern sNumber

extern sAnswer1
extern sAnswer2

segment .text
global test
test:
    mov     ax,                 [sNumber]
    mov     word[sAnswer1],     ax             ;   sAnswer1 = sNumber

    mov     ax,                 [sNumber]
    not     ax
    mov     word[sAnswer2],     ax

    ret