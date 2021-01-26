#include <iostream>
#include <stdint.h>
#include <bitset>

// 비트연산 문제
// n1 = ((a & b) | c) ^ d;
// n2 = ~n1;

extern void test() asm("test");

extern int n1 asm("n1");
extern int n2 asm("n2");

int a, b, c, d;

int main(int argc, char* argv[])
{
    a = 0x12;
    b = 0x34;
    c = 0x56;
    d = 0x78;

    test();

    printf("n1 = %08x\n", n1);
    printf("n2 = %08x\n", n2);

    return 0;
}