#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 111p. 연습문제 - 5
// 다음 C언어의 f() 함수를 어셈블리어로 나타내면 다음과 같다. 빈칸을 채우시오.

// extern int a, b, c;
// int f(int x) 
// {
//     return a * x * x + b * x + c;
// }

extern int f(int x) asm("f");
int a, b, c;

int main()
{
    a = 3;
    b = 2;
    c = 1;
    printf("%d\n", f(3)); // 27 + 6 + 1
}