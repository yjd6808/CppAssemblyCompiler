#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 118p. 연습문제 - 8
// 다음 C함수를 어셈블리어로 변경하라


// 1) 2차 함수
// int f(int x)
// {
//     return x * x + 2 * x + 3;
// }

// 2) 조건문
// int check(int input)
// {
//     if (input < 0)
//         return -input;
//     else if (input == 0)
//         return 0;
//     else
//         return input * input;
// }

// 3) 반복문
// int fact(int n)
// {
//     int i, 
//     int f = n;

//     for (i = n - 1; i > 0; i--)
//         f = f * i;
//     return f;
// }

// 4) 1의 개수 구하기
// int ones(int n)
// {
//     return n의 비트중 1의 갯수 반환
// }


// 5) 홀수와 짝수
// int isOdd(int n)
// {
//     return 홀수이면 1 짝수이면 0 반환
//}


extern int f(int x) asm("f");
extern int check(int input) asm("check");
extern int fact(int n) asm("fact");
extern int ones(int n) asm("ones");
extern int isOdd(int n) asm("isOdd");

int main()
{
    printf("x * x + 2 * x + 3 : %d\n", f(5));
    printf("check 5 : %d\n", check(5));
    printf("check 0 : %d\n", check(0));
    printf("check -1 : %d\n", check(-1));
    printf("fact 5 : %d\n", fact(5));
    printf("fact 10 : %d\n", fact(10));
    printf("ones 5 : %d\n", ones(5));
    printf("ones -1 : %d\n", ones(-1));
    printf("ones 8 : %d\n", ones(8));
    printf("ones 12 : %d\n", ones(12));
    printf("ones 14 : %d\n", ones(14));
    printf("ones 15 : %d\n", ones(15));
    printf("isOdd 1 : %d\n", isOdd(1));
    printf("isOdd 2 : %d\n", isOdd(2));
    printf("isOdd 3 : %d\n", isOdd(3));
}