#include <iostream>
#include <stdint.h>
#include <bitset>

// 75p. 연습문제 (2)
//
// 다음 명령들이 실행된 후 AL 레지스터의 내용 및 CF, ZF, SF, OF 플래그의 내용은 무엇인가? 그 이유도 설명하라.
// mov      al,     255
// mov      ah,     5
// add      al,     ah
//
// AL = 255 =   1111 1111
// AH =   5 =   0000 0101
// AL +  AH = 1 0000 0100 = 4
//
// -> AL = 4
// -> CF = 1 : MSB에서 올림 발생하였기 때문에 캐리 플래그가 1로 설정된다.
// -> ZF = 0 : 0이 아니므로 제로 플래그는 0이 된다.
// -> SF = 0 : AL 레지스터의 결과 값이 양수 이므로 사인 플래그가 0이 된다.
// -> OF = 0 : 8번째 비트와 7번째 비트가 같기 때문에 오버 플래그가 0이다.
//
// ======================================================================================
//
// 75p. 연습문제 (3)
//
// 레지스터 AL 에는 120, AH 에는 -30이 들어있다. 다음 명령이 실행되면 AL 레지스터의 값과 플래그
// CF, ZF, SF, OF는 각각 어떻게 변하는가 이유도 설명하라
//
// 1) add   al,     ah
//   0111 1000 (120)
// + 1110 0010 (-30)
// -----------
// 1 0101 1010 = 90
// -> AL = 90
// -> CF = 1    :   MSB에서 올림이 발생하였기 때문
// -> ZF = 0    :   계산결과 값이 0이 아니기 때문
// -> SF = 0    ;   계산결과 값이 양수이므로
// -> OF = 0    ;   7번째 비트와 8번째 비트가 같으므로
//
// 2) sub   al,     ah
//   120 - (-30) = 120 + 30과 같다.
//
// -> AL = -106
// -> CF = ?    :   MSB에서 올림이 발생하지 않았기 때문
// -> ZF = 0    :   계산결과 값이 0이 아니기 때문
// -> SF = 1    ;   계산결과 값이 음수 이기 때문
// -> OF = 1    ;   7번째 비트와 8번째 비트가 달라졌으므로
//
// 3) neg   al
// neg 연산은 0에서 피연산자를 뺀 연산이다.
//
//   0000 0000 = 0
// + 1000 1000 = -120
// -----------
//   1000 1000
// -> AL = -120
// -> CF = 0    :   ??
// -> ZF = 0    :   계산결과 값이 0이 아니기 때문
// -> SF = 1    ;   계산결과 값이 음수이므로
// -> OF = 1    ;   7번째 비트와 8번째 비트가 달라졌으므로
//
// 4) mov   al,     ah
// -> AL = -30
// -> 모든 플래그 0 : mov 명령어는 플래그에 영향을 주지 않는다.
//
// ======================================================================================
//
// 76p. 연습문제 (4)
//
// 각 항목마다 EAX 레지스터의 값과 CF, ZF, SF가 어떻게 변하는지 설명하라.
// 순서대로 실행되는 것이 아니다. 각각
//
// 1) mov       eax,        -1
// -> EAX = -1
// -> CF = 1, ZF = 1, SF = 1
// -> 플래그 값은 변경사항이 없다.
//
// 2) neg       eax
// -> EAX = -1
// -> CF = ? : 
// -> ZF = 0 : 0이 아니기 때문
// -> SF = 1 : 음수이기 때문
//
// 3) ror       2
// -> EAX = -1
// -> CF = 0 : MSB 올림이 발생하지 않았으므로 0으로 변경됨
// -> ZF = 1 : 변경되지 않는다. 초기값 그대로
// -> SF = 0 : 0001 -> 0100 : MSB는 0이 되므로 0으로 바뀜
//
// 4) not       eax
// -> EAX = 4294967294 = 0xfffffffe
// -> CF = 1, ZF = 1, SF = 1
// -> not 연산은 플래그 값을 변경시키지 않는다.
//
// 5) or        eax,    0x0000ff00
// -> EAX = 0x0000ff01
// -> CF = 0 / MSB 올림이 발생하지 않았으므로 0
// -> ZF = 0 / 연산결과가 0이 아니므로 0
// -> SF = 0 / 연산결과 MSB가 1이 아니므로 0
//
// 6) xor       eax,    eax
// -> EAX = 0x0
// -> CF = 0 / MSB 올림이 발생하지 않았으므로 0
// -> ZF = 1 / 연산결과가 0이므로 1
// -> SF = 0 / 연산결과 MSB가 1이 아니므로 0
//
// 7) test      eax,    0
// -> EAX = 0x0
// -> CF = 0 / MSB 올림이 발생하지 않았으므로 0
// -> ZF = 1 / 연산결과가 0이므로 1
// -> SF = 0 / 연산결과 MSB가 1이 아니므로 0

// (1) 문제 함수
extern void check_add() asm("check_add");

// (2) 문제 함수
extern void check_2_add() asm("check_2_add");
extern void check_2_sub() asm("check_2_sub");
extern void check_2_neg() asm("check_2_neg");
extern void check_2_mov() asm("check_2_mov");


// 플래그 확인함수
extern void check_flags() asm("check_flags");

int _zf, _sf, _of, _cf;
int ret;

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
    std::cout << "ret : "  << std::bitset<8>(ret).to_string() << std::endl;
    print_flag();

    check_2_add();
    check_flags();
    print_flag();
    std::cout << "check_2_add" << std::endl;

    check_2_sub();
    check_flags();
    print_flag();
    std::cout << "check_2_sub" << std::endl;

    check_2_neg();
    check_flags();
    print_flag();
    std::cout << "check_2_neg" << std::endl;

    check_2_mov();
    check_flags();
    print_flag();


    return 0;
}