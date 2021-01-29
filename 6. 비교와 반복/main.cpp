#include <iostream>
#include <stdint.h>
#include <bitset>

extern void check_overflow_flag() asm("check_overflow_flag");

int iValue_1;
int iValue_2;
int iValue_3;
int iValue_4;

short sValue_1;
short sValue_2;
short sValue_3;
short sValue_4;

char cValue_1;
char cValue_2;
char cValue_3;
char cValue_4;

int main()
{
    check_overflow_flag();
    std::cout << std::bitset<16>(sValue_1) << std::endl;
    std::cout << std::bitset<16>(sValue_2) << std::endl;
    std::cout << std::bitset<16>(sValue_3) << std::endl;

    return 0;
}
