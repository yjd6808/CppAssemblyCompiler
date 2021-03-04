#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 82p. 연습문제 (15)

// 1 ~ 100사이의 범위에 있는 자연수중 4로 나누었을 때 나머지가 0인 수의 합을 구하는 함수를 어셈블리어로 작성하시오.
// 단 idv, div 명령어를 사용해서는 안됨
//
// 하위 1, 2번째 비트가 0인경우가 4로 나누었을 때 나머지가 0이다.

extern void test() asm("test");

int n, sum, i;

int main(int argc, char* argv[])
{
    n = 4;
    test();
    printf("1 ~ %d 사이 : %d : i = %d\n", n, sum, i);

    n = 8;
    test();
    printf("1 ~ %d 사이 : %d : i = %d\n", n, sum, i);

    n = 12;
    test();
    printf("1 ~ %d 사이 : %d : i = %d\n", n, sum, i);

    n = 100;
    test();
    printf("1 ~ %d 사이 : %d : i = %d\n", n, sum, i);

    return 0;
}

