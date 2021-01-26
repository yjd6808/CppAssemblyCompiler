#include <iostream>

extern void function() asm ("function");
extern int dwNumber1;
extern int dwNumber2;

int main()
{
    function();

    std::cout << "dwNumber1 : " << dwNumber1 << std::endl;
    std::cout << "dwNumber2 : " << dwNumber2 << std::endl;

    return 0;
}