#include <stdio.h>

extern int realdata;
extern void function();
extern int function2() asm ("function2");
int sum asm ("sum");

int main()
{
    sum = 100;
    function();
    function2();
    printf("%d\n", realdata);
    printf("%d\n", sum);
    return 0;
}