segment .data
global realdata
realdata dd 1

segment .bss
extern sum

segment .text:
global function2
function2:
    mov eax,    10
    mov dword[sum],    eax
    ret