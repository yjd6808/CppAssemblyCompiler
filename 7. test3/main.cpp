#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 110p. 연습문제 - 1
// 1 ~ 100까지 자연수를 차례대로 푸쉬하는 프로그램을 작성하라 푸쉬하기 전 ESP 레지스터 값은 전역변수 bottom에 푸시한 후, 
// ESP 값은 전역변수 top에 각각 저장한다.

extern int test() asm("test");

int bottom, top, last_value;

int main(int argc, char* argv[])
{
    test();
    printf("bottom : %u / top : %u / last_value : %d\n", bottom, top, last_value);

    return 0;
}

