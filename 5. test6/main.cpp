#include <iostream>
#include <stdint.h>
#include <bitset>

// 비트 확장과 비트 축소 관련문제이다.
// 1) 1바이트 문자형 변수 c = 10일때 이를 비트 확장하여 s = 10, i = 10이 되도록하라
// 2) 1바이트 문자형 변수 c = -10일때 이를 비트 확장하여 s = -10, i = -10이 되도록하라
// 3) 4바이트 정수형 변수 i = 100일때 이를 비트 축소하여 s = 100, c = 100이 되도록하라
// 3) 4바이트 정수형 변수 i = -100일때 이를 비트 축소하여 s = -100, c = -100이 되도록하라

extern void test() asm("test");

char c;
short s;
int i;

extern void increate_type_casting() asm("increate_type_casting");
extern void decrease_type_casting() asm("decrease_type_casting");

int main(int argc, char* argv[])
{
    c = 10;
    increate_type_casting();
    printf("c : %d\ns : %d\ni = %d\n", c, s, i);

    c= -10;
    increate_type_casting();
    printf("c : %d\ns : %d\ni = %d\n", c, s, i);

    i = 100;
    decrease_type_casting();
    printf("c : %d\ns : %d\ni = %d\n", c, s, i);

    i = -100;
    decrease_type_casting();
    printf("c : %d\ns : %d\ni = %d\n", c, s, i);
    return 0;
}