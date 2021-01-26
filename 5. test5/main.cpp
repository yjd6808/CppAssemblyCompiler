#include <iostream>
#include <stdint.h>
#include <bitset>

// n의값을 읽고 짝수인지 홀수인지 판별하는 프로그램을 작성하라

extern void test() asm("test");

extern int iResult asm("iResult");
int iNumber;


int main(int argc, char* argv[])
{
    iNumber = 100;
    test();
    printf("%s\n", iResult == 1 ? "짝수" : "홀수");

    iNumber = 123;
    test();
    printf("%s\n", iResult == 1 ? "짝수" : "홀수");

    iNumber = 1521;
    test();
    printf("%s\n", iResult == 1 ? "짝수" : "홀수");

    return 0;
}