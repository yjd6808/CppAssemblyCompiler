#include <iostream>
#include <stdint.h>
#include <bitset>

// 79p. 연습문제 (10)
//
// 다음 C 프로그램을 Assembly어로 번역하시오
//

// 1)
// int i;
//
// if (i < 10)
//     i = i + 1;
// else
//     i = 100;

// 2)

// int i;

// while (i >= 0)
// 	   i--;

extern void test_1() asm("test_1");
extern void test_2() asm("test_2");

int i;

int main(int argc, char* argv[])
{
	int temp = i = -1;
	test_1();
	printf("%d / i = %d\n", temp, i);

	temp = i = 100;
	test_1();
	printf("%d / i = %d\n", temp, i);

	temp = i = 20;
	test_2();
	printf("%d / i = %d\n", temp, i);

    return 0;
}

