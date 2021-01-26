#include <iostream>
#include <stdint.h>
#include <bitset>

// 문제
// y = ax + b
// a와 b는 프로그램 실행시 인자로 전달받는다.
// x값에 값을 넣을때마다 y값을 보여주는 함수를 만들어라
extern void test() asm("test");
int a, b, x, y;

int main(int argc, char* argv[])
{
    if (argc != 3)
    {
        std::cout << "Usage : main a b" << std::endl;
        return -1;
    }

    a =  atoi(argv[1]);
    b =  atoi(argv[2]);

    printf("Linear function y = %dx + %d\n", a, b);
    printf("==========================================\n");
    printf("x\ty\n");
    for (x = 0; x < 20; x++)
    {
        test();
        printf("%d\t%d\n", x, y);
    }

    return 0;
}