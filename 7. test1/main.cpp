#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 93p. 7.5.4 실습

// void max(int a, int b)
// {
//     int m;

//     if (a > b)
//         m = a;
//     else
//         m = b;
//     result = m;
// }

// 위의 max 함수를 어셈블리어로 구현하시오

extern void max(int a, int b) asm("max");

int esp_a, esp_b, result;

int main(int argc, char* argv[])
{
    int a = 3;
    int b = 4;

    max(a, b);
    printf("%d max %d = %d\n", esp_a, esp_b, result);

    a = -1;
    b = -5;

    max(a, b);
    printf("%d max %d = %d\n", esp_a, esp_b, result);

    return 0;
}

