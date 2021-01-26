; 작성자 : 윤정도
; 작성일 : 2020-01-21 (목)
; 목적   : 역수, 곱셈, 나눗셈

segment .bss
extern cpp_cByte
extern cpp_sWord
extern cpp_dWord

global asm_dwValue1
global asm_dwValue2
global asm_dwValue3
global asm_fValue1
global asm_fValue2
global asm_fValue3

global asm_wValue1
global asm_wValue2
global asm_wValue3

global asm_bValue1
global asm_bValue2
global asm_bValue3

asm_dwValue1    resd    1
asm_dwValue2    resd    1
asm_dwValue3    resd    1
asm_fValue1     resd    1
asm_fValue2     resd    1
asm_fValue3     resd    1
asm_wValue1    resw    1
asm_wValue2    resw    1
asm_wValue3    resw    1
asm_bValue1    resb    1
asm_bValue2    resb    1
asm_bValue3    resb    1

segment .text
global initialize
initialize:
    mov byte[cpp_cByte],    1
    mov word[cpp_sWord],    2
    mov dword[cpp_dWord],   3

    mov dword[asm_dwValue1],   1
    mov dword[asm_dwValue2],   1
    mov dword[asm_dwValue3],   1

    mov dword[asm_wValue1],   1
    mov dword[asm_wValue2],   1
    mov dword[asm_wValue3],   1
    ret

global reverse_value
reverse_value:
    neg byte[cpp_cByte]
    neg word[cpp_sWord]
    neg dword[cpp_dWord]
    ret

global multi_value
multi_value:    
    ;   n bit * n bit = 2n bit

    mov bl,    10                   ;   bl = 10
    mov al,    2                    ;   al = 2
    mul bl                          ;   ax = al * bl
    mov word[asm_dwValue1], ax      ;   asm_dwValue1 = ax = 20

    mov     eax,    100             ;   eax = 100
    imul    eax,    2               ;   eax = eax * 2
    mov dword[asm_dwValue1], eax    ;   asm_dwValue1 = eax = 200

    ;  mul : unsigned 계산용
    mov     bl,    100              ;   bl = 100
    mov     al,    1                ;   al = 1
    mul     bl                      ;   ax = al * bl
    mov     word[asm_wValue1],    ax;   asm_wValue1 = 100

    ;  imul : signed 계산용
    mov     bl,     5               ;   bl = 5
    mov     al,    -3               ;   al = -3
    imul    bl                      ;   ax = al * bl
    mov     word[asm_wValue2],    ax;   asm_wValue2 = -15

    ret

global divide_value
divide_value:
    ;   2n bit / n bit = n bit ... nbit
    mov     bl, 5                   ;   bl = 5
    mov     ax, 6                   ;   al = 5
    div     bl                      ;   ax / bl = al ... ah
    mov     byte[asm_bValue1],    al;   asm_wValue1 = ax(몫)
    mov     byte[asm_bValue2],    ah;   asm_wValue2 = dx(나머지)

    ret