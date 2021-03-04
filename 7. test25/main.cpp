#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 121p. 연습문제 - 25
// 다음 C 함수를 어셈블리어로 번경하라

// int f()
// {
//     char c1, c2;

//     c1 = 127;
//     c2 = c1 << 3;

//     return (int)(c1 | c2);
// }

extern int f(void) asm("f");

int clang_f()
{
    char c1, c2;

    c1 = 127;
    c2 = c1 << 3;

    return (int)(c1 | c2);
}

int main()
{
    printf("clang_f() = %d\n", clang_f());
    printf("f() = %d\n", f());
}
