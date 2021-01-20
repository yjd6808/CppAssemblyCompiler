segment .data
global realdata
realdata dd 1

segment .text:
global _test
_test:
    mov eax,    5
    ret