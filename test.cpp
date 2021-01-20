#include <stdio.h>

extern int realdata;
extern void function();

int main()
{
    function();
    printf("%d\n", realdata);
    return 0;
}