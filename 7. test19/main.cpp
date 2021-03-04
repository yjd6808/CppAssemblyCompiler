#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 119p. 연습문제 - 17, 18
// 1) 아래 sum 함수를 어셈블리어로 번역하시오
// 2) sum(4)의 값은 얼마인가?
// 3) sum(4)의 스택높이가 최고가 되었을 때의 내용을 그려라

// int sum(int n)
// {
//     if (n == 0)
//         return 0;
//     return n + sum(n - 1);
// }

extern int sum(int n) asm ("sum");

int main()
{
    printf("0 ~ 100의 합 = %d\n", sum(100));
    printf("0 ~ 50의 합 = %d\n", sum(50));
    printf("0 ~ 4의 합 = %d\n", sum(4));
}
