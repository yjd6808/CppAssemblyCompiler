#include <iostream>
#include <stdint.h>
#include <bitset>

//문제
//n2에는 n1의 역수가 들어가야한다.
//c에는 a, b의 곱이 들어가야한다.
//x를 y로 나눈 몫이 q 나머지는 q에 들어간다.
//어셈블리어로 test() 함수를 완성하시오

extern void test() asm("test");
int n1, n2, a, b, c, x, y, p, q;

int main()
{
    n1 = 5;
    a = 25;
    b = 3;
    x = 70;
    y = 4;

    test();

    printf("n2 : %d\n", n2);
    printf("c : %d\n", c);
    printf("p : %d / q : %d\n", p, q);
    return 0;
}