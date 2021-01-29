#include <iostream>
#include <stdint.h>
#include <bitset>

// 77p. 연습문제 (6)
//
// 다음 C 코드를 어셈블리 언어로 변환하라. 단, 변수 n은 EAX 레지스터에 해당한다.
//
// while ( n < 100 )
//     n++;

extern void test() asm("test");

int ret;

int main(int argc, char* argv[])
{
    test();
    printf("ret : %d\n", ret);
    return 0;
}

