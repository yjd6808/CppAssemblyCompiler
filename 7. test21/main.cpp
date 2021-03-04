#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 120p. 연습문제 - 20
// 1) 아래 subtract 함수를 어셈블리어로 번역하시오.

// extern int cf;
// int subtract(int a, int b)
// {
//     // 뺄셈 결과의 캐리 플래그 내용을 cf에 저장
//     return a - b;
// }

extern int subtract(int a, int b) asm("subtract");
int _cf;

int main()
{
    printf("subtract(1, -10) = %d\n", subtract(1, -10));
    printf("cf = %d\n", _cf);
    printf("subtract(20, 30) = %d\n", subtract(20, 30));
    printf("cf = %d\n", _cf);
    printf("subtract(30, 20) = %d\n", subtract(30, 20));
    printf("cf = %d\n", _cf);
}
