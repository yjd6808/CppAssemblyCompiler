#include <iostream>
#include <stdint.h>
#include <bitset>

// 실습 : 다음 C프로그램과 같은 기능을 하는 test함수를 작성하시오

extern void test() asm("test");

int grade, score;

// 예시 코드
// void test_code()
// {
//     if ( score > 90 )
//         grade = 10;
//     else if (score < 60)
//         grade = 0;
//     else
//         grade = 5;
// }

int main(int argc, char* argv[])
{
    score = 95;
    test();
    printf("grade : %d\n", grade);

    score = 80;
    test();
    printf("grade : %d\n", grade);

    score = 40;
    test();
    printf("grade : %d\n", grade);


    
    return 0;
}