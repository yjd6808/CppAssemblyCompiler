#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 118p. 연습문제 - 14
// 1) 아래 C 프로그램을 전체를 어셈블리어로 번역하시오

//  int max(int a, int b, int c)
//  {
//     int m;

//     if (a > b)
//         m = a;
//     else
//         m = b;

//     if (c > m)
//         m = c;

//     return m;
//  }

extern int max(int a, int b, int c) asm ("max");

int main()
{
    printf("max(3, 5, 7) = %d\n", max(3, 5, 7));
    printf("max(-1, -5, -3) = %d\n", max(-1, -5, -3));
    printf("max(1, 10, 5) = %d\n", max(1, 10, 5));
}
