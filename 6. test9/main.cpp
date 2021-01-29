#include <iostream>
#include <stdint.h>
#include <bitset>

// 78p. 연습문제 (8)
//
// 1 부터 100까지 짝수의 합을 구하는 프로그램 evenSum 함수를 작성하고자 한다.
// 결과 값은 전역변수 result에 들어간다.
//
// void evenSum()
// {
//     ret = 0;

//     for (int i = 1; i < n; i++)
//     {
//         if (i & 0x1)
//             continue;
//         else
//             ret += i;
//     }
// }

extern void evenSum() asm("evenSum");

int ret, n, i;

int main(int argc, char* argv[])
{
    n = 100;
    evenSum();
    printf("n : %d\ni : %d\nret : %d\n", n, i, ret);
    return 0;
}

