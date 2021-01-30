#include <iostream>
#include <stdint.h>
#include <bitset>

// 79p. 연습문제 (11)
//
// 다음 C 프로그램을 Assembly어로 번역하시오
//

// 1)

// if (a < b || a >= c)
// 		a = a + b;
// else if (b != c)
// 		a = a / 4
// else
// 		a = -c

// 2)

// for (a = 0; a < 100; a++)
// 		b = b - a + c;

extern void test_1() asm("test_1");
extern void test_2() asm("test_2");

int a, b, c;

int main(int argc, char* argv[])
{
	a = 5;
	b = 10;
	c = 3;
	test_1();
	printf("test_1 : a = %d\n", a);

	a = 5;
	b = 4;
	c = 6;
	test_1();
	printf("test_1 : a = %d\n", a);

	a = 5;
	b = 4;
	c = 3;
	test_2();
	printf("test_2 : b = %d\n", b);

    return 0;
}

