#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 101p. 7.7.3 실습

// int max(int a, int b)
// {
//     if (a > b)
//         return a
//     else
//         return b
// }

// 위의 max 함수를 어셈블리어로 구현하시오

extern int max(int a, int b) asm("max");

int esp_a, esp_b, result;

int main(int argc, char* argv[])
{
    int a = 3;
    int b = 4;

    printf("%d max %d = %d\n", esp_a, esp_b, max(a, b));

    a = -1;
    b = -5;

    printf("%d max %d = %d\n", esp_a, esp_b, max(a, b));

    return 0;
}

