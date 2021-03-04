#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 121p. 연습문제 - 23
// 아래 power2 함수를 어셈블리어로 번역하라.
// power2함수는 2의 n승의 값의 결과를 반환해주는 함수이다.

// int power2(int n)
// {
//     int result = 1;
//     result = result << n;
//     return result;
// }

extern int power2(int n) asm("power2");

int main()
{
    printf("power2(1) = %d\n", power2(1));
    printf("power2(2) = %d\n", power2(2));
    printf("power2(3) = %d\n", power2(3));
    printf("power2(4) = %d\n", power2(4));
    printf("power2(5) = %d\n", power2(5));
}
