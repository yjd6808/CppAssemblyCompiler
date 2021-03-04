#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 80p. 연습문제 (14)

// 입력받은 수의 PF(패러티 플래그) 상태를 확인할 수 있도록 코드를 구현하시오

extern void GetParity() asm("GetParity");

int n, parity;

int main(int argc, char* argv[])
{
    srand(time(NULL));

    while (true)
    {
        n = rand() % 100;
        GetParity();
        printf("n = %d / %s / parity : %d\n", n, std::bitset<8>(n).to_string().c_str(), parity);
        sleep(3);
    }
    
    return 0;
}

