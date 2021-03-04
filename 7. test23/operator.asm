; 작성자 : 윤정도
; 작성일 : 2020-02-07 (일)

; 121p. 연습문제 - 23
; 아래 power2 함수를 어셈블리어로 번역하라.
; power2함수는 2의 n승의 값의 결과를 반환해주는 함수이다.

; int power2(int n)
; {
;     int result = 1;
;     result = result << n;
;     return result;
; }

segment .text
global power2
power2:
			push		ebp
			mov			ebp,		esp
			sub			esp,		4

			mov			eax,		1
			mov			[ebp - 4],	eax		;	int result = 1
			
			mov			eax,		[ebp - 4]
			mov			ecx,		[ebp + 8]
			sal			eax,		cl		;	result = result << n
			
DONE:		mov			esp,		ebp
			pop			ebp
			ret