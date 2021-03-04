; 작성자 : 윤정도
; 작성일 : 2020-02-06 (토)

; 111p. 연습문제 - 4
; 1) 함수 f()를 어셈블리어로 번역하라
; 2) 함수 f()가 호출되기 전 스택 포인터의 값이 십진수 1000이라고 가정하고 f()가 호출된 시점의 스택 내용을 그려라 ESP가 어떻게 달라지는가?

;	f() 호출 전
;	┼───────────────────┼ 988
;	│	   10, esp
;	┼───────────────────┼ 992
;	│	   20
;	┼───────────────────┼ 996
;	│	   ebp
;	┼───────────────────┼ 1000

;	f() 호출 후
;	┼───────────────────┼ 980
;	│	  ebp, esp
;	┼───────────────────┼ 984
;	│	return address
;	┼───────────────────┼ 988
;	│	   10
;	┼───────────────────┼ 992
;	│	   20
;	┼───────────────────┼ 996
;	│	   ebp
;	┼───────────────────┼ 1000

; 3) 함수 f() 실행이 끝나고 다시 main 함수로 돌아온 직후의 스택내용을 그려라 ESP가 어떻게 달라지는가?

;	f() 함수 돌아온 직후
;	┼───────────────────┼ 988
;	│	   10, esp
;	┼───────────────────┼ 992
;	│	   20
;	┼───────────────────┼ 996
;	│	   ebp
;	┼───────────────────┼ 1000

; void f(int n, int m)
; {
;     n = n - m;
; }

segment .data
msg_n	db		'n = %d',	10,		0
msg_m	db		'm = %d',	10,		0

segment .text
extern printf
global f
f:
		push		ebp
		mov			ebp,			esp

		mov			eax,			[ebp + 8]		;	eax = n
		mov			ebx,			[ebp + 12]		;	ebx = m

		push		eax
		push		msg_n
		call		printf

		push		ebx
		push		msg_m
		call		printf

		mov			eax,			[ebp + 8]		;	eax = n
		mov			ebx,			[ebp + 12]		;	ebx = m

		sub			eax,			ebx				;	eax = n - m

		push		eax
		push		msg_n
		call		printf

		mov			esp,			ebp
		pop			ebp
		ret
		