#include <iostream>
#include <stdint.h>
#include <bitset>
#include <unistd.h>

// 115p. 연습문제 - 10
// 비트 마스킹 : 다음 기능을 하는 함수를 어셈블리어로 작성하시오
// 다음 함수는 파라미터 num을 이진수로 나타내었을 때 b0 번째 비트를 0으로 b1번째 비트를 1로 만든다.

extern int setBits(int n, int b0, int b1) asm("setBits");

int main()
{
    printf("setBits(0, 10, 31)\n%s == %d\n%s == %d\n======\n", 
    std::bitset<32>(0).to_string().c_str(), 
    0, 
    std::bitset<32>(setBits(0, 10, 31)).to_string().c_str(),
    setBits(0, 10, 31));

    printf("setBits(1, 0, 31)\n%s == %d\n%s == %d\n======\n", 
    std::bitset<32>(1).to_string().c_str(), 
    1, 
    std::bitset<32>(setBits(1, 0, 31)).to_string().c_str(),
    setBits(1, 0, 31));

    printf("setBits(2, 1, 30)\n%s == %d\n%s == %d\n======\n", 
    std::bitset<32>(2).to_string().c_str(), 
    2, 
    std::bitset<32>(setBits(2, 1, 30)).to_string().c_str(),
    setBits(2, 1, 30));

    return 0;
}