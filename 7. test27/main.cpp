#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 121p. 연습문제 - 27
// 1) 다음 C 프로그램을 NASM 어셈블리어로 작성하시오
// 2) 이 때 f(5)의 값은 얼마인가?

// 배열의 엘리먼트들의 총합을 계산하는 함수인듯?

// int a[] = { 0, 1, 0, 1, 0, 1, 0, 1};

// int f(int n)
// {
//     if (n == 0)
//         return 0;
//     return f(n - 1) + a[n - 1];
// }

#define ARR_LEN 8
int a[] = {0, 0, 0, 0, 0, 0, 0, 0};

extern int f(int n) asm("f");

int main()
{
    for (int i =0; i < ARR_LEN; i++)
        a[i] = i + 1;
    //a[] = {1, 2, 3, 4, 5, 6, 7, 8} 로 바꿔줌
    printf("a[] = {1, 2, 3, 4, 5, 6, 7, 8} = %d\n", f(8));

    for (int i =0; i < ARR_LEN; i++)
        a[i] = i * 2;
    //a[] = {0, 2, 4, 6, 8, 10, 12, 14} 로 바꿔줌
    printf("a[] = {0, 2, 4, 6, 8, 10, 12, 14} = %d\n", f(8));

    return 0;
}