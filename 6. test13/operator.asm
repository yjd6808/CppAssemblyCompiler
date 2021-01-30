; 작성자 : 윤정도
; 작성일 : 2020-01-30 (토)

; 79p. 연습문제 (12)
;
; 다음 어셈블리어를 C언어로 변환하시오
;

; "Assembly"
; 		cmp		eax,	ebx
; 		jne		L1
; L3:	inc		eax,
; 		jmp		L2
; L1:	cmp		ecx,	edx
; 		jne		L4
; 		jmp		L3
; L4:	cmp		eax,	0
; 		je		L2
; 		neg		eax	
; L2:

; "C Lang"
; void func()
; {
; 	int a, b, c, d;

; 	if (a != b)
; 		goto L1;
; L3:
; 	a++;
; 	goto L2;
; L1:
; 	if (c != d)
; 		goto L4;
; 	goto L3;
; L4:
; 	if (a == 0)
; 		goto L2;
; 	a = -a;
; L2:
; }
