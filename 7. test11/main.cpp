#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 114p. 연습문제 - 9
// 다음 기능을 하는 어셈블리 코드를 작성하라
// 이 함수는 파라미터가 2진수로 표현했을때 bit가 1인 bit의 갯수가 짝수이면 1을 홀수개이면 0을 반환한다.
// ex) 1100 -> 1반환 / 11001 -> 0 반환

extern int isEvenOne(int n) asm("isEvenOne");

int main()
{
    printf("isEvenOne 5 : %d\n", isEvenOne(5));
    printf("isEvenOne -1 : %d\n", isEvenOne(-1));
    printf("isEvenOne -2 : %d\n", isEvenOne(-2));
    return 0;
}