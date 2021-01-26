#include <iostream>
#include <stdint.h>

extern char asm_cNumber1 asm("asm_cNumber1");
extern char asm_cNumber2 asm("asm_cNumber2");

extern unsigned char asm_ucNumber1 asm("asm_ucNumber1");
extern unsigned char asm_ucNumber2 asm("asm_ucNumber2");

extern void function() asm("function");

int main()
{
    function();

    printf("asm_cNumber1 : %d\n", asm_cNumber1);
    printf("asm_cNumber2 : %d\n", asm_cNumber2);

    printf("asm_ucNumber1 : %d\n", asm_ucNumber1);
    printf("asm_ucNumber2 : %d\n", asm_ucNumber2);

    return 0;
}