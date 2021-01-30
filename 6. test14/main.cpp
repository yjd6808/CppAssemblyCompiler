#include <iostream>
#include <stdint.h>
#include <bitset>

// 79p. 연습문제 (13)

// 전역변수 n이 2진수로 표현될 때 1로 설정된 비트의 갯수를 확인하는 어셈블리 코드를 작성하시오

extern void test() asm("test");

int n, count;

int main(int argc, char* argv[])
{
    n = 0b1111011;
    test();
    printf("n : %d\ncount : %d\n=================\n", n, count);

    n = 0b10101010;
    test();
    printf("n : %d\ncount : %d\n=================\n", n, count);

    n = 0b00001111;
    test();
    printf("n : %d\ncount : %d\n=================\n", n, count);

    return 0;
}

