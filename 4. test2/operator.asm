; 작성자 : 윤정도
; 작성일 : 2020-01-22 (금)

; 문제
; a = b = 5
; c = a + b - 3;
; a = a + a + a;
; 연산을 수행하는 함수를 어셈블리어로 test() 함수를 완성하시오

segment .bss
extern a, b, c

segment .text
global test
test:
    mov dword[b],   5
    mov eax,        [b]
    mov dword[a],   eax     ;   a = b = 5

    mov eax,    [b]
    sub eax,    3
    add eax,    [a]
    mov dword[c],   eax     ;   c = a + b - 3

    mov eax,    [a]
    add eax,    [a]
    add eax,    [a]
    mov dword[a],   eax     ;   a = a + a + a

    ret


    