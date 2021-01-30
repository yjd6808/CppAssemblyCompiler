; 작성자 : 윤정도
; 작성일 : 2020-01-30 (토)

; 79p. 연습문제 (13)

; 전역변수 n이 2진수로 표현될 때 1로 설정된 비트의 갯수를 확인하는 어셈블리 코드를 작성하시오

segment .data
idx                 db          0
int_bit_size        db          32

segment .bss
extern n, count

segment .text
global test
test:
        mov     byte[idx],      0
        mov     dword[count],   0

WHILE:  mov     al,             byte[idx]
        cmp     al,             byte[int_bit_size]
        jge     DONE
        mov     eax,            [n]
        shr     eax,            1
        mov     dword[n],       eax
        jnc     CARRY0

CARRY1: mov     eax,            [count]
        inc     eax
        mov     dword[count],   eax
        jmp     CARRY0

CARRY0: mov     al,             byte[idx]
        inc     al
        mov     byte[idx],      al
        jmp     WHILE

DONE:   ret