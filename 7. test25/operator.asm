; 작성자 : 윤정도
; 작성일 : 2020-02-07 (일)

; 121p. 연습문제 - 25
; 다음 C 함수를 어셈블리어로 번경하라

; int f()
; {
;     char c1, c2;

;     c1 = 127;
;     c2 = c1 << 3;

;     return (int)(c1 | c2);
; }

segment .text
global f
f:
			push		ebp
			mov			ebp,		esp
			sub			esp,		2

			mov			al,			127
			mov			[ebp - 4],	al			;	c1 = 127

			sal			al,			3
			mov			[ebp - 5],	al			;	c2 = c1 << 3

			mov			al,			[ebp - 4]
			or			al,			[ebp - 5]	;	al = c1 | c2
			movsx		eax,		al			;	eax = al
			mov			esp,		ebp
			pop			ebp
			ret