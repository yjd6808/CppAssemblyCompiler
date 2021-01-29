#include <iostream>
#include <stdint.h>
#include <bitset>

// 76p. 연습문제 (5)
//
// 조건문 다음과 같은 기능흘 하도록 test.asm 파일을 작성하라.
//
// void test() {
//     if (input < 0)
//         output = -input;
//     else if (input == 0)
//         output = 0;
//     else   
//         output = input * input;
// }

extern void test() asm("test");

int input, output;

int main(int argc, char* argv[])
{
    input = -50;
    test();
    printf("input : %d\noutput : %d\n=================\n", input, output);

    input = 0;
    test();
    printf("input : %d\noutput : %d\n=================\n", input, output);

    input = 50;
    test();
    printf("input : %d\noutput : %d\n=================\n", input, output);


    return 0;
}

