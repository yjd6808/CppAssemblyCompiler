#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 111p. 연습문제 - 4
// 1) 함수 f()를 어셈블리어로 번역하라
// 2) 함수 f()가 호출되기 전 스택 포인터의 값이 십진수 1000이라고 가정하고 f()가 호출된 시점의 스택 내용을 그려라 ESP가 어떻게 달라지는가?
// 3) 함수 f() 실행이 끝나고 다시 main 함수로 돌아온 직후의 스택내용을 그려라 ESP가 어떻게 달라지는가?

// void f(int n, int m)
// {
//     n = n - m;
// }

extern void f(int n, int m) asm("f");
 
int main(int argc, char* argv[])
{
    int i, j;
    i = 10;
    j = 20;
    f(i, j);

    printf("i = %d\nj = %d\n", i, j);
    return 0;
}

