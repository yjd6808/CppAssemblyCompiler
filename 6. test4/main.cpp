#include <iostream>
#include <stdint.h>
#include <bitset>

// 75p. 연습문제 (1)
//
// AL 레지스터에는 1, AH 에는 -1이 들어있다. 다음 명령어를 실행하면 AL 레지스터의 값은 어떻게 변경되는가?
// 또한 CF, ZF, SF, OF 플래그 값은 어떻게 변경되는가?
//
// 머리속으로 풀어봄
// 1) add al, ah
// -> al = 0
// -> CF = 1, ZF = 1, SF = 0, OF = 0
// 2) xor al, al
// -> al = 0
// -> CF = 0, ZF = 1, SF = 0, OF = 0
// 3) mov al, ah
// -> al = -1
// -> CF = 0, ZF = 0, SF = 1, OF = 0
// -> mov 연산시에는 플래그 값이 변경되지 않는다 따라서 모든 CF, ZF, SF, OF 모두 0이다.

extern void check_add() asm("check_add");
extern void check_xor() asm("check_xor");
extern void check_mov() asm("check_mov");

extern void check_flags() asm("check_flags");

int _zf, _sf, _of, _cf;

void print_flag()
{
    std::cout << "============================" << std::endl;
    printf("ZF : %d\n", _zf);
    printf("SF : %d\n", _sf);
    printf("OF : %d\n", _of);
    printf("CF : %d\n", _cf);
}

int main(int argc, char* argv[])
{
    check_add();
    check_flags();
    print_flag();

    check_xor();
    check_flags();
    print_flag();

    check_mov();
    check_flags();
    print_flag();

    return 0;
}