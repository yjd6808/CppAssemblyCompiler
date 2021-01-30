#include <iostream>
#include <stdint.h>
#include <bitset>

// 78p. 연습문제 (9)
//
// 다음 C 프로그램을 Assembly어로 번역하시오
//

// 1)
// int i;

// if (i > 0 && i < 10)
//     i = -i;
// else
//     i = 0

// 2)
// {
// 		int i, s;
//	 	for (i = 1; i <= 10; i++)
//	    	s = s + i;
// }

// 3)
// {
// 		int a, b, c, s;
// 		s = a + 2 * b - 4 * c;
// }



extern void test_1() asm("test_1");
extern void test_2() asm("test_2");
extern void test_3() asm("test_3");

int i, s, a, b, c;

int main(int argc, char* argv[])
{
	int temp = i = 8;
	test_1();
	printf("%d : i = %d\n", temp, i);

	i = 0;
	s = 0;
	test_2();
	printf("i = %d\n", i);
	printf("s = %d\n", s);

	a = b = c = 5;
	test_3();
	printf("a = %d\n", a);
	printf("b = %d\n", b);
	printf("c = %d\n", c);
	printf("s = %d\n", s);

    return 0;
}

