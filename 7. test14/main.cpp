#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 117p. 연습문제 - 12
// 1) 아래 C 프로그램을 전체를 어셈블리어로 번역하시오
// 2) sum에서 for 문장이 실행되기 직전의 스택내용을 그려라
// 3) sum의 실행이 끝나고 다시 main으로 돌아온 직후 스택 내용을 그려라

// int sum(int n)
// {
//     int i;
//     int s = 0;

//     for (i = 1; i <= n; i++)
//         s = s + i;
//     return s;
// }

// int main()
// {
//     int i = 100;
//     i = sum(i);
//     printf("1 ~ 100 : %d\n", i);
// }