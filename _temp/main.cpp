#include <iostream>
#include <stdint.h>
#include <bitset>

extern void test() asm("test");
extern void mul_test() asm("mul_test");

int n;
int p;
int q;

unsigned int value;

int main(int argc, char* argv[])
{
    // n = 20;
    // test();
    // printf("n = %d\nn / 4 = %d\nn % 4 = %d\n", n, p, q);
    // std::cout << "==============================" << std::endl;

    // n = 32;
    // test();
    // printf("n = %d\nn / 4 = %d\nn % 4 = %d\n", n, p, q);
    // std::cout << "==============================" << std::endl;

    // n = 13;
    // test();
    // printf("n = %d\nn / 4 = %d\nn % 4 = %d\n", n, p, q);
    // std::cout << "==============================" << std::endl;
    // return 0;

    value = 5;
    mul_test();
    printf("5 * 21 = %d\n", value);

    value = 8;
    mul_test();
    printf("8 * 21 = %d\n", value);

    value = 15;
    mul_test();
    printf("15 * 21 = %d\n", value);
}