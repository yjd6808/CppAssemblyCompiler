; 작성자 : 윤정도
; 작성일 : 2020-01-24 (일)

; 각 명령들이 위에서 아래로 실행된다 각 명령을 실행할 때마다 eax 레지스터의 값을 8자리 16진수 정수로 표현하시오
; xor       eax,        eax
; mov       al,         -50
; cbw
; shl       eax,        2
; sar       ax,         3
; and       ah,         al


segment .bss
global  iValue
iValue      resd    1


segment .text
global step1
step1:
    xor     eax,            eax         ;   eax ^ eax eax에 쓰레기 값이 들어있지만 같은 쓰레기값 간의 베타 연산은 항상 0으로 나오게된다.
                                        ;   0x00000000
    ret

global step2
step2:
    mov     al,             -50         ;   0x000000CE
    ret

global step3
step3:
    cbw                                 ;   0x0000ffCE
    ret

; 0000 0000
; 0000 0000
; 1111 1111
; 1100 1110    


global step4
step4:
    shl     eax,            2           ;   0x0003ff38
    ret

; 0000 0000
; 0000 0011
; 1111 1111
; 0011 1000    


global step5
step5:
    sar,    ax,             3           ;   0x003ffE7
    ret

; 0000 0000
; 0000 0011
; 1111 1111 하위 16비트만 산술 비트 쉬프트 오른쪽으로 3회 수행
; 1110 0111

global step6
step6:
    and     ah,             al          ;   0x003E7E7
    ret

; 0000 0000
; 0000 0011
; 1111 1111 ah
; 1110 0111 al
; ---------
; 1110 1111

; ah에 연산 결과가 저장되므로

; 0000 0000
; 0000 0011
; 1110 0111 ah
; 1110 0111 al
