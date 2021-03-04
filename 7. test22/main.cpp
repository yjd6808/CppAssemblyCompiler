#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 120p. 연습문제 - 22
// 아래 negate(char c) 함수는 파리미터 c에 대한 2의 보수를 반환한다.
// 결과로 변경되는 오버 플래그는 전역변수 of에 저장한다.

// int _of;
// char negate(char c)
// {
//     // of = 2의 보수 연산 후 오버 플래그값 저장
//     return -c;
// }

extern char negate(char c) asm("negate");
int _of;

int main()
{
    printf("negate(-1) = %d\n", negate(-1));
    printf("of = %d\n", _of);

    printf("negate(1) = %d\n", negate(1));
    printf("of = %d\n", _of);

    printf("negate(-128) = %d\n", negate(-128));
    printf("of = %d\n", _of);
}
