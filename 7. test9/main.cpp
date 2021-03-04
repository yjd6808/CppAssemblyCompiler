#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 112p. 연습문제 - 6
// 113p. 연습문제 - 7

// 파라미터를 가진 함수 max()는 인수 a, b를 비교하여 그 중 큰 값을 result라는 전역변수에 저장한다.
// max 함수를 NASM 어셈블리어 언어로 구현하라

// extern int result;

// void max(int a, int b)
// {
//     int m;
//     if (a > b)
//         m = a;
//     else
//         m = b;
//     result = m;    
// }

extern void max(int a, int b) asm("max");

int result;

int main()
{
    max(3, 5);
    printf("result : %d\n",result);

    max(-1, -5);
    printf("result : %d\n",result);
}