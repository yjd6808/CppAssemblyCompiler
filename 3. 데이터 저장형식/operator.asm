; 작성자 : 윤정도
; 작성일 : 2020-01-21 (목)
; 목적   : 자료형 확인

segment .bss
global asm_cNumber1
global asm_cNumber2

global asm_ucNumber1
global asm_ucNumber2

asm_cNumber1    resb  1
asm_ucNumber1    resb  1

asm_cNumber2    resb  1
asm_ucNumber2    resb  1

segment .text

global function
function:
    mov byte[asm_cNumber1], 255
    mov byte[asm_ucNumber1], 255

    mov byte[asm_cNumber2], -1
    mov byte[asm_ucNumber2], -1
    ret