; 작성자 : 윤정도
; 작성일 : 2020-01-22 (금)

; 산술연산 조합 문제
; result1 = b * b - 4 * a * c;
; result2 = -result1;
; quotient = result1 / 100;
; remainder = result1 % 100;

segment .bss
extern a, b, c

global result1
global result2
global quotient
global remainder

result1     resd    1
result2     resd    1
quotient    resd    1
remainder   resd    1

segment .text
global test
test:
    imul    ecx,    [a],    4       ;   ecx = a * 4
    imul    ecx,    [c]             ;   ecx *= c

    mov     eax,    [b]
    imul    eax,    [b]             ;   eax = b * b

    sub     eax,    ecx             ;   ebx -= eax
    mov     dword[result1], eax     ;   result1 = ebx

    mov     eax,    [result1]
    neg     eax
    mov     dword[result2], eax     ;   result2 = -result1

    mov     eax,    [result1]
    mov     ebx,    100
    cdq                             ;   eax데이터를 edq에 걸쳐 저장한다.
    idiv    ebx
    mov     dword[quotient],    eax ;   quotient = result1 / 100
    mov     dword[remainder],   edx ;   remainder = result1 % 100

    ret