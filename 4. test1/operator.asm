; 작성자 : 윤정도
; 작성일 : 2020-01-22 (금)

; 문제
; n2에는 n1의 역수가 들어가야한다.
; c에는 a, b의 곱이 들어가야한다.
; x를 y로 나눈 몫이 q 나머지는 q에 들어간다.
; 어셈블리어로 test() 함수를 완성하시오

segment .bss
extern n1, n2, a, b, c, x, y, p, q;

segment .text
global test
test:
    mov     eax,    [n1]
    neg     eax
    mov     dword[n2],  eax     ;   n2에는 n1의 역수가 들억간다.

    mov     eax,    [a]
    imul    dword[b]
    mov     dword[c],   eax     ;   c = a * b

    mov     eax,    [x]
    idiv    dword[y]
    mov     dword[p],   eax     ;   p = a / b
    mov     dword[q],   edx     ;   p = a % b

    ret


    