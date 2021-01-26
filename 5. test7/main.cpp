#include <iostream>
#include <stdint.h>
#include <bitset>

// 다음 연산을 계산하는 어셈블리 코드를 작성하시오
// value = value * 21을 구현하시오. 
// 참고) value는 unsigned 형임

// 1) mul 명령어를 사용하여 구현하시오
// 2) shift와 add 명령어를 사용하여 구현하시오

extern void mul_test() asm("mul_test");
extern void shift_add_test() asm("shift_add_test");
extern void shift_add_test_2() asm("shift_add_test_2");

int value;

int main(int argc, char* argv[])
{
    value = 5;
    mul_test();
    printf("5 * 21 = %d -- mul\n", value);

    value = 5;
    shift_add_test();
    printf("5 * 21 = %d -- shift and add\n", value);

    value = 5;
    shift_add_test_2();
    printf("5 * 35 = %d -- shift and add\n", value);

    return 0;
}