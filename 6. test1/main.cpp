#include <iostream>
#include <stdint.h>
#include <bitset>

// 실습 : 연산을 수행해서 CF, ZF, SF, OF 플래그들의 변화를 확인하시오.

extern void add_test() asm("add_test");
extern void sub_test() asm("sub_test");
extern void mul_test() asm("mul_test");
extern void div_test() asm("div_test");

extern void check_flags() asm("check_flags");

int a, b;
int p, q;

int _zf, _sf, _of, _cf, _pf, _af;

void print_flag()
{
    std::cout << "============================" << std::endl;
    printf("ZF : %d\n", _zf);
    printf("SF : %d\n", _sf);
    printf("OF : %d\n", _of);
    printf("CF : %d\n", _cf);
    std::cout << "============================" << std::endl;
}

int main(int argc, char* argv[])
{
    a = 0;
    b = -1;

    add_test();
    check_flags();
    printf("%d + %d = %d\n", a, b, p);
    print_flag();

    a = UINT32_MAX;
    b = 0;

    add_test();
    check_flags();
    printf("%d + %d = %d\n", a, b, p);
    print_flag();

    a = 1;
    b = 1;

    add_test();
    check_flags();
    printf("%d + %d = %d\n", a, b, p);
    print_flag();

    return 0;
}