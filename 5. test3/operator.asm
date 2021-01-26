; 작성자 : 윤정도
; 작성일 : 2020-01-24 (일)

; 형변환 및 비트 연산 문제
; s = (short)n;
; n = (n >> 5) | (n & 0x1f)
; n++

segment .data
global n
n       dd      10

segment .bss
extern s



segment .text
global test
test:
    mov         ax,         [n]
    mov         word[s],    ax

    mov         eax,        [n]
    sar         eax,        5

    mov         ebx,        [n]
    and         ebx,        0x1f

    or          eax,        ebx
    mov         dword[n],   eax

    add         dword[n],   1



    ret