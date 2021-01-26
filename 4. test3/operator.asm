; 작성자 : 윤정도
; 작성일 : 2020-01-22 (금)

; 문제
; y = ax + b
; a와 b는 프로그램 실행시 인자로 전달받는다.
; x값에 값을 넣을때마다 y값을 보여주는 함수를 만들어라

segment .bss
extern a, b, x, y

segment .text
global test
test:
    mov     eax,    [a]
    imul    dword[x]            ;   eax = a * x
    add     eax,    dword[b]    ;   eax += b
    mov     dword[y],   eax     ;   y = eax

    ret


    