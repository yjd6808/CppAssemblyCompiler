; 작성자 : 윤정도
; 작성일 : 2020-01-20 (수)
; 목적   : 덧셈 뺄샘 학습

segment .bss
global dwNumber1
global dwNumber2

dwNumber1   resd    1
dwNumber2   resd    1

segment .text
global function
function:
    ; 내가 스스로 짠거
    ; mov eax,     10                         ; eax = 10
    ; mov dword[dwNumber1],   eax             ; dwNumber1 = 10
    ; mov eax,    [dwNumber1]                 ; eax = 10
    ; mov ebx,    5                           ; ebx = 5
    ; add eax,    ebx                         ; eax = 15
    ; mov dword[dwNumber2],   eax             ; dwNumber2 = 15
    ; mov eax,    [dwNumber1]                 ; eax = 10
    ; mov ebx,    [dwNumber2]                 ; ebx = 15
    ; add eax,    ebx                         ; eax = 25
    ; mov dword[dwNumber2],   eax             ; dwNumber2 = 25
    ; mov eax,    [dwNumber2]                 ; eax = 25
    ; mov ebx,    5                           ; ebx = 5
    ; sub eax,    ebx                         ; eax = 25 - 5
    ; mov dword[dwNumber1],   eax             ; dwNumber1 = 20
    ; mov eax,    [dwNumber2]                 ; eax = 25
    ; mov ebx,    [dwNumber1]                 ; ebx = 20
    ; sub eax,    ebx                         ; eax = 25 - 20
    ; mov dword[dwNumber1],   eax             ; dwNumber1 = 5

    ; 개선안
    mov dword[dwNumber1],   10                  ; dwNumber1 = 10
    mov eax,                [dwNumber1]         ; dwNumber2 = dwNumber1 + 5
    add eax,                5
    mov dword[dwNumber2],   eax
    mov eax,                [dwNumber2]         ; dwNumber2 = dwNumber2 + dwNumber1
    add eax,                [dwNumber1]
    mov dword[dwNumber2],   eax
    mov eax,                [dwNumber2]         ; dwNumber1 = dwNumber2 - 5
    sub eax,                5
    mov dword[dwNumber1],   eax                     
    mov eax,                [dwNumber2]         ; dwNumber1 = dwNumber2 - dwNumber1
    sub eax,                [dwNumber1]
    mov dword[dwNumber1],   eax
