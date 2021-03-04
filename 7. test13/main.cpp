#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 117p. 연습문제 - 11
// 재귀 함수 : 아래 fact() 함수를 어셈블리어로 변경하라

// int fact(int n)
// {
//     if (n == 1)
//         return 1;
//     else
//         return fact(n - 1) * n;
// }

extern int fact(int n) asm("fact");

int main()
{
    printf("fact(5) = %d\n", fact(5));
    printf("fact(4) = %d\n", fact(4));

    return 0;
}