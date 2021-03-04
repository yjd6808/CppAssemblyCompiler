; 작성자 : 윤정도
; 작성일 : 2020-02-06 (토)

; 111p. 연습문제 - 3
; 1) 다음 메인함수를 어셈블리어로 작성하라 
; 2) 다음 시작할 때부터 종료될때까지 스택의 모양이 어떻게 변하는지 그림으로 나타내라
; printf 푸쉬 스택은 고려하지 않고 함

; extern int f(int n, int m) asm("f");

; int main(int argc, char* argv[])
; {
;     int i, j;
;     i = 5;
;     j = 10;
;     i = f(i, j);
;     return 0;
; }

segment .data
message_1: 	db  'i = %d', 10, 0
message_2: 	db  'j = %d', 10, 0

segment .text
extern	printf

global	main
main:
	push	ebp
	mov		ebp,			esp

;	┼───────────────────┼
;	│	 ebp, esp
;	┼───────────────────┼


	sub		esp,			8

;	┼───────────────────┼
;	│		esp
;	┼───────────────────┼
;	│	 쓰레기 값
;	┼───────────────────┼
;	│	   ebp
;	┼───────────────────┼
	
	mov		eax,			5
	mov		[ebp - 4],		eax				;	i = 5


;	┼───────────────────┼
;	│		esp
;	┼───────────────────┼
;	│	 	5
;	┼───────────────────┼
;	│	   ebp
;	┼───────────────────┼

	mov		ebx,			10
	mov		[ebp - 8],		ebx				;	j = 10

;	┼───────────────────┼
;	│	10,		esp
;	┼───────────────────┼
;	│		5
;	┼───────────────────┼
;	│	   ebp
;	┼───────────────────┼

	push	eax
	push	message_1
	call	printf
	add		esp,			8

	push	ebx
	push	message_2
	call	printf
	add		esp,			8

	call	f

;	┼───────────────────┼
;	│		10 (j), esp
;	┼───────────────────┼
;	│		5 (i)
;	┼───────────────────┼
;	│	   ebp
;	┼───────────────────┼

	mov		[ebp - 8],		eax				;	i = f(i, j)

	mov		eax,			[ebp - 8]
	mov		ebx,			[ebp - 4]

	push	eax
	push	message_1
	call	printf

	push	ebx
	push	message_2
	call	printf

	mov		esp,			ebp
	pop		ebp
	ret

global f
f:
;	함수 호출 후
;	┼───────────────────┼
;	│		ebp, esp
;	┼───────────────────┼
;	│	  복귀 주소
;	┼───────────────────┼
;	│		10 (j)
;	┼───────────────────┼
;	│		5 (i)
;	┼───────────────────┼
;	│	   ebp
;	┼───────────────────┼
	push	ebp
	mov		ebp,			esp

	mov		eax,			[ebp + 12]		;	eax = i
	mov		ebx,			[ebp + 8]		;	ebx = j

	sub		ebx,			eax				;	ebx = j - i
	mov		eax,			ebx				;	eax = ebx

	mov		esp,			ebp
	pop		ebp
;	┼───────────────────┼
;	│	  복귀 주소
;	┼───────────────────┼
;	│		10 (j)
;	┼───────────────────┼
;	│		5 (i)
;	┼───────────────────┼
;	│	   ebp
;	┼───────────────────┼
	ret