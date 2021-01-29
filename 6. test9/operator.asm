; 작성자 : 윤정도
; 작성일 : 2020-01-29 (금)


; 78p. 연습문제 (8)
;
; 1 부터 100까지 짝수의 합을 구하는 프로그램 evenSum 함수를 작성하고자 한다.
; 결과 값은 전역변수 result에 들어간다.
;
; void evenSum()
; {
;     ret = 0;

;     for (i = 1; i < n; i++)
;     {
;         if (i & 0x1)
;             continue;
;         else
;             ret += i;
;     }
; }

segment .bss
extern i, n, ret

segment .text
global evenSum
evenSum:

				mov		dword[ret],			0

				mov		dword[i],			1
FOR:			mov		eax,				[n]
				cmp		dword[i],			eax
				jge		DONE
				test	dword[i],			1		; if (i & 0x1)
				jnz		FIN							; continue
				mov		eax,				dword[ret]
				add		eax,				dword[i]
				mov		dword[ret],			eax		; ret += i
				mov		eax,				dword[i]
				jmp		FIN
FIN:			mov		eax,				[i]
				inc		eax
				mov		dword[i],			eax
				jmp		FOR

DONE:			ret