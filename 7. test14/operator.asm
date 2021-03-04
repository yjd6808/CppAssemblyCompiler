; 작성자 : 윤정도
; 작성일 : 2020-02-07 (일)

; 117p. 연습문제 - 12
; 1) 아래 C 프로그램을 전체를 어셈블리어로 번역하시오
; 2) sum에서 for 문장이 실행되기 직전의 스택내용을 그려라

;	┼───────────────────┼ 976
;	│	   i = 쓰레기값
;	┼───────────────────┼ 980
;	│	   s = 0
;	┼───────────────────┼ 984
;	│	   ebp, esp
;	┼───────────────────┼ 988
;	│	   ra
;	┼───────────────────┼ 992
;	│	   100
;	┼───────────────────┼ 996
;	│	   ebp
;	┼───────────────────┼ 1000


; 3) sum의 실행이 끝나고 다시 main으로 돌아온 직후 스택 내용을 그려라

;	┼───────────────────┼ 992
;	│	   100,	esp
;	┼───────────────────┼ 996
;	│	   ebp
;	┼───────────────────┼ 1000


; int sum(int n)
; {
;     int i;
;     int s = 0;

;     for (i = 1; i <= n; i++)
;         s = s + i;
;     return s;
; }

; int main()
; {
;     int i = 100;
;     i = sum(i);
;     printf("1 ~ 100 : %d\n", i);
; }

segment .data
msg		db		'1 ~ 100 : %d',	10,	0

segment .text
extern printf

global main
main:
			push	ebp
			mov		ebp,		esp

			mov		eax,		100
			mov		[ebp - 4],	eax			;	i = 100

			push	eax
			call	sum
			mov		[ebp - 4],	eax			;	i = sum(i)

			push	eax
			push	msg
			call	printf

			mov		esp,		ebp
			pop		ebp
			ret

global	sum
sum:
			push	ebp
			mov		ebp,		esp

			mov		eax,		0
			mov		[ebp - 4],	eax			;	s = 0

			mov		eax,		1
			mov		[ebp - 8],	eax			;	i = 1

FOR:		mov		eax,		[ebp - 8]		
			cmp		eax,		[ebp + 8]	
			jg		DONE
			
			mov		eax,		[ebp - 4]
			add		eax,		[ebp - 8]
			mov		[ebp - 4],	eax			;	s = s + i

			mov		eax,		[ebp - 8]
			inc		eax
			mov		[ebp - 8],	eax			;	i++
			jmp		FOR

DONE:		mov		eax,		[ebp - 4]
			mov		esp,		ebp
			pop		ebp
			ret