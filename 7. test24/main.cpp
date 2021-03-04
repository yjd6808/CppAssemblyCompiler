#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 121p. 연습문제 - 24
// 함수 log2(int n)은 n이 2의 몇승인지 반환해준다. 해당 기능을 하는 함수를 어셈블리어로 작성하시오
// ex) log2(16) = 4
// ex) log2(256) = 8
// 힌트) n을 k회 우측 쉬프트 하면 n % 2의k승이 된다.


extern int log2(int n) asm("log2");

int main()
{
    printf("log2(4) = %d\n", log2(4));
    printf("log2(16) = %d\n", log2(16));
    printf("log2(256) = %d\n", log2(256));
    printf("log2(1024) = %d\n", log2(1024));
}
