; 작성자 : 윤정도

segment .bss
extern n, p, q, value

segment .text
global test
test:
    ; 32bit / 32bit
    mov     eax,    [n]
    mov     ecx,    4
    cdq
    idiv    ecx

    mov     dword[p],   eax
    mov     dword[q],   edx

    ret

global mul_test
mul_test:
    mov     eax,            [value]
    mov     ebx,            21
    mul     ebx

    mov     dword[value],   eax

    ret