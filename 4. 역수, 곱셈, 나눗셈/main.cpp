#include <iostream>
#include <stdint.h>
#include <bitset>

extern void initialize() asm("initialize");
extern void reverse_value() asm("reverse_value");
extern void multi_value() asm("multi_value");
extern void divide_value() asm("divide_value");

char cpp_cByte asm("cpp_cByte");
short cpp_sWord asm("cpp_sWord");
int cpp_dWord asm("cpp_dWord");

extern int asm_dwValue1;
extern int asm_dwValue2;
extern int asm_dwValue3;
extern float asm_fValue1;
extern float asm_fValue2;
extern float asm_fValue3;
extern char asm_bValue1;
extern char asm_bValue2;
extern char asm_bValue3;

extern short asm_wValue1;
extern short asm_wValue2;
extern short asm_wValue3;

int main()
{
    printf("[역수]\n");
    initialize();

    printf("cpp_cByte : %d\n", cpp_cByte);
    printf("cpp_sWord : %d\n", cpp_sWord);
    printf("cpp_dWord : %d\n", cpp_dWord);

    reverse_value();
    printf("=====================================\n");

    printf("cpp_cByte : %d\n", cpp_cByte);
    printf("cpp_sWord : %d\n", cpp_sWord);
    printf("cpp_dWord : %d\n", cpp_dWord);

    multi_value();
    printf("=====================================\n");
    printf("[곱셈]\n");
    printf("asm_dwValue1 : %d\n", asm_dwValue1);

    divide_value();
    printf("=====================================\n");
    printf("[나눗셈]\n");
    printf("몫 : %d / 나머지 : %d\n", asm_bValue1, asm_bValue2);
    
    return 0;
}