#include <iostream>
#include <stdint.h>
#include <bitset>

// 문제
// a = b = 5
// c = a + b - 3;
// a = a + a + a;
// 연산을 수행하는 함수를 어셈블리어로 test() 함수를 완성하시오
extern void test() asm("test");
int a, b, c;

int main()
{
    test();

    printf("a : %d\n", a);
    printf("b : %d\n", b);
    printf("c : %d\n", c);
    return 0;
}