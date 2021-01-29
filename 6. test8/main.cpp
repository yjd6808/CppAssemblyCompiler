#include <iostream>
#include <stdint.h>
#include <bitset>

// 77p. 연습문제 (7)
//
// 다음 팩토리얼 계산 C 코드를 어셈블리 언어로 변환하라.
//
// extern int i, n, fact
//
// void test() 
// {
//     fact = n;
//     for (i = n - 1; i > 0; i--)
//         fact = fact * i;
// }

extern void test() asm("test");

int i, n, fact_ret;

int main(int argc, char* argv[])
{
    n = 9;
    test();
    printf("ret : %d\n", fact_ret);
    return 0;
}

