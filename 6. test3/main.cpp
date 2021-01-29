#include <iostream>
#include <stdint.h>
#include <bitset>

// 실습
// 외부 전역변수 num을 1부터 num까지 자연수의 합을 계산하여 외부 전역변수 sum에 그 값을 저장하는 기능을 하는
// test함수를 어셈블리어로 작성하시오

extern void test() asm("test");

int num, sum;

int main(int argc, char* argv[])
{
    num = 50;
    test();
    printf("1 ~ %d sum : %d\n", num, sum);

    num = 100;
    test();
    printf("1 ~ %d sum : %d\n", num, sum);
    
    return 0;
}