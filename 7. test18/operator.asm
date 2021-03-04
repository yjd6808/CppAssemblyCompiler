; 작성자 : 윤정도
; 작성일 : 2020-02-07 (일)

; 118p. 연습문제 - 14
; 1) 아래 C 프로그램을 전체를 어셈블리어로 번역하시오

;  int max(int a, int b, int c)
;  {
;     int m;

;     if (a > b)
;         m = a;
;     else
;         m = b;

;     if (c > m)
;         m = c;

;     return m;
;  }


segment .text
global max
max:
			push	ebp
			mov		ebp,		esp

			mov		eax,		[ebp + 8]
			cmp		eax,		[ebp + 12]
			jle		ELSE
			mov		eax,		[ebp + 8]
			mov		[ebp - 4],	eax
			jmp		IF_END

ELSE:		mov		eax,		[ebp + 12]
			mov		[ebp - 4],	eax
			jmp		IF_END

IF_END:		mov		eax,		[ebp + 16]
			cmp		eax,		[ebp - 4]
			jle		DONE

			mov		eax,		[ebp + 16]
			mov		[ebp - 4],	eax
			jmp		DONE

DONE:		mov		eax,		[ebp - 4]
			mov		esp,		ebp
			pop		ebp
			ret