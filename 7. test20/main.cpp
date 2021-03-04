#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 120p. 연습문제 - 20
// 1) 아래 f함수를 어셈블리어로 번역하시오. 함수 프롤로그, 에필로그, 어셈블러 디렉티브를 포함할 것

// int value;

// void f(int a, int b)
// {
//     int n, m;
//     n = a + b;
//     m = a * b;

//     if (n > m)
//         value = 0;
//     else
//         value = 1;
// }

extern void f(int a, int b) asm ("f");
extern int value;

int main()
{
    f(-1, -1);
    printf("f(-1, -1) = %d\n", value);

    f(1, -1);
    printf("f(-1, -1) = %d\n", value);
    
}
