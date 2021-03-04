#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 117p. 연습문제 - 13
// 1) 아래 C 프로그램을 전체를 어셈블리어로 번역하시오

// int max(int a, int b)
// {
//     if (a > b)
//         return a;
//     return b;
// }

extern int max(int a, int b) asm ("max");

int main()
{
    printf("max(3, 5) = %d\n", max(3, 5));
    printf("max(-1, -5) = %d\n", max(-1, -5));
}
