#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 111p. 연습문제 - 2
// 함수 f()는 레지스터 eax, ebx, ecx, edx 값을 순서대로 스택에 넣은 후(push) 다시 그값을 빼내어 위 순서대로 
// 넣는다(pop). 즉 레지스터 eax, ebx, ecx, edx는 edx, ecx, ebx, eax 레지스터로 옮겨지게 된다. 이렇게 작동하도록
// f() 함수를 어셈블리어로 작성하시오

extern int f() asm("f");

int a, b, c, d;

int main(int argc, char* argv[])
{
    a = 1;
    b = 2;
    c = 3;
    d = 4;

    f();

    printf("a = %d\n", a);
    printf("b = %d\n", b);
    printf("c = %d\n", c);
    printf("d = %d\n", d);

    return 0;
}

