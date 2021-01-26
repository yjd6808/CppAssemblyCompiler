#include <iostream>
#include <stdint.h>
#include <bitset>

// 보수연산 문제
// 1) 16비트 정수형 16진수 0xC2A5를 십진수로 나타내어라.
// 2) 16비트 정수형 16진수 0xC2A5의 1의 보수를 구하자

extern void test() asm("test");

short sNumber;

short sAnswer1;
short sAnswer2;

int main(int argc, char* argv[])
{
    sNumber = 0xC2A5;

    test();

    printf("주어진 값 : %d\t/%x\n", sNumber, (uint16_t)sNumber);

    printf("sAnswer1 = %d\t/%x\n", sAnswer1, (uint16_t)sAnswer1);
    printf("sAnswer2 = %d\t/%x\n", sAnswer2, (uint16_t)sAnswer2);

    return 0;
}