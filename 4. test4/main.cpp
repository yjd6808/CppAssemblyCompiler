#include <iostream>
#include <stdint.h>
#include <bitset>

// 산술연산 조합 문제
// result1 = b * b - 4 * a * c;
// result2 = -result1;
// quotient = result1 / 100;
// remainder = result1 % 100;


extern void test() asm("test");

extern int result1 asm("result1");
extern int result2 asm("result2");
extern int quotient asm("quotient");
extern int _remainder asm("remainder");

int a, b, c;

int main(int argc, char* argv[])
{
    a = 5;
    b = 20;
    c = 2;
    
    test();

    printf("result1 = %d\n", result1);      //  360
    printf("result2 = %d\n", result2);      //  -360
    printf("quotient = %d\n", quotient);    //  3
    printf("_remainder = %d\n", _remainder);  //  60

    return 0;
}