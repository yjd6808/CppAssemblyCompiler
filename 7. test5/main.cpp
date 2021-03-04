#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 어셈블리어로 C 함수 호출 테스트

extern void test() asm("test");

int func(int a) asm("func");

int func(int a)
{
    return 10;
}

int ret;

int main(int argc, char* argv[])
{
    test();
    printf("%d\n", ret);
    return 0;
}

