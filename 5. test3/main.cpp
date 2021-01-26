#include <iostream>
#include <stdint.h>
#include <bitset>

// 형변환 및 비트 연산 문제
// s = (short)n;
// n = (n >> 5) | (n & 0x1f)
// n++

extern void test() asm("test");

extern int n asm("n");
short s;

int main(int argc, char* argv[])
{
    test();

    printf("s=%d\t/%04x\n", s, (uint16_t)s);
	printf("n=%d\t/%08x\n", n, n);

    return 0;
}