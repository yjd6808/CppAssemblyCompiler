#include <iostream>
#include <stdint.h>
#include <bitset>

//===== bit shift
extern void left_shift() asm("left_shift");
extern void right_shift() asm("right_shift");
extern void logical_shift() asm("logical_shift");
extern void arithmetic_shift() asm("arithmetic_shift");

//===== logical operations
extern void and_operation() asm("and_operation");
extern void or_operation() asm("or_operation");
extern void xor_operation() asm("xor_operation");
extern void not_operation() asm("not_operation");

//===== bit masking
extern void LSB_to_1() asm("LSB_to_1");
extern void MSB_to_1() asm("MSB_to_1");
extern void LSB_to_0() asm("LSB_to_0");
extern void MSB_to_0() asm("MSB_to_0");

//===== endian
extern void check_processor_endian() asm("check_processor_endian");

//===== data type conversion
extern void check_cbw_init() asm("check_cbw_init");
extern void check_cbw() asm("check_cbw");

extern void check_cwd_init() asm("check_cwd_init");
extern void check_cwd() asm("check_cwd");

extern void check_cwde_init() asm("check_cwde_init");
extern void check_cwde() asm("check_cwde");

extern void check_movsx_init() asm("check_movsx_init");
extern void check_movsx() asm("check_movsx");

extern void check_movzx_init() asm("check_movzx_init");
extern void check_movzx() asm("check_movzx");

//===== bit circulation
extern void check_rol() asm("check_rol");
extern void check_ror() asm("check_ror");

extern void check_cf_on_rcl() asm("check_cf_on_rcl");
extern void check_cf_off_rcl() asm("check_cf_off_rcl");

extern void check_cf_on_rcr() asm("check_cf_on_rcr");
extern void check_cf_off_rcr() asm("check_cf_off_rcr");


int iValue_1;
int iValue_2;
int iValue_3;
int iValue_4;

short sValue_1;
short sValue_2;
short sValue_3;
short sValue_4;

char cValue_1;
char cValue_2;
char cValue_3;
char cValue_4;

int main()
{
    //===== bit shift
    left_shift();

    printf("[왼쪽 시프트]\n");
    printf("1 << 2 : %d\n", iValue_1);

    right_shift();

    printf("[오른쪽 시프트]\n");
    printf("4 >> 2 : %d\n", iValue_1);

    logical_shift();

    printf("[오른쪽 논리 시프트]\n");
    printf("-32 >> 2 before : %d\t%s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    printf("-32 >> 2 after  : %d\t%s\n", cValue_2, std::bitset<8>(cValue_2).to_string().c_str());

    arithmetic_shift();

    printf("[오른쪽 산술 시프트]\n");
    printf("-32 >> 2 before : %d\t%s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    printf("-32 >> 2 after  : %d\t%s\n", cValue_2, std::bitset<8>(cValue_2).to_string().c_str());

    std::cout << " ======================================================================= " << std::endl;
    //===== logical operations
    and_operation();

    printf("[AND 논리 연산]]\n");
    printf("1100(12) & 1010(10) : %s\n", std::bitset<8>(cValue_1).to_string().c_str());

    or_operation();

    printf("[OR] 논리 연산]]\n");
    printf("1100(12) | 1010(10) : %s\n", std::bitset<8>(cValue_1).to_string().c_str());

    xor_operation();

    printf("[XOR] 논리 연산]]\n");
    printf("1100(12) ^ 1010(10) : %s\n", std::bitset<8>(cValue_1).to_string().c_str());

    not_operation();

    printf("[NOT] 논리 연산]]\n");
    printf("~0000 1010(10) : %s\n", std::bitset<8>(cValue_1).to_string().c_str());

    std::cout << " ======================================================================= " << std::endl;
    //===== bit masking

    LSB_to_1();

    printf("[LSB to 1]\n");  
    printf("0000 1010(10) => %s\n", std::bitset<8>(cValue_1).to_string().c_str());

    LSB_to_0();

    printf("[LSB to 0]\n");  
    printf("0000 1011(11) => %s\n", std::bitset<8>(cValue_1).to_string().c_str());

    MSB_to_1();

    printf("[MSB to 1]\n");  
    printf("0000 1011(11) => %s\n", std::bitset<8>(cValue_1).to_string().c_str());

    MSB_to_0();

    printf("[MSB to 0]\n");  
    printf("1000 1011(-117) => %s\n", std::bitset<8>(cValue_1).to_string().c_str());

    std::cout << " ======================================================================= " << std::endl;
    //===== endian
    
    iValue_1 = 0x12345678;

    check_processor_endian();

    printf("num : %x\n", iValue_1);
    printf("%x %x %x %x\n", cValue_1, cValue_2, cValue_3, cValue_4);

    std::cout << " ======================================================================= " << std::endl;
    //===== data type conversion

    cValue_1 = -5;
    sValue_1 = -10;

    check_cbw_init();
    printf("[cbw]\n");
    printf("cbw before : cValue :%d\tsValue :%d\n", cValue_1, sValue_1);
    printf("register : al : 0x%x\tah : 0x%x\n", cValue_3 & 0xff, cValue_4 & 0xff);

    check_cbw();
    
    printf("cbw after  : cValue :%d\tsValue :%d\n", cValue_1, sValue_1);
    printf("register : al : 0x%x\tah : 0x%x\n", (unsigned char)cValue_3, (unsigned char)cValue_4);

    sValue_1 = -5;
    iValue_1 = -10;

    check_cwd_init();
    printf("[cwd]\n");
    printf("cwd before : sValue :%d\tiValue :%d\n", sValue_1, iValue_1);
    printf("register : ax : 0x%x\tdx : 0x%x\n", (uint16_t)sValue_3, (uint16_t)sValue_4);

    check_cwd();
    printf("cwd after : ax와 dx데이터를 어떻게 하나로 합치지?\n");
    printf("register : ax : 0x%x\tdx : 0x%x\n", (uint16_t)sValue_3, (uint16_t)sValue_4);

    sValue_1 = -5;
    iValue_1 = -10;

    check_cwde_init();
    printf("[cwde]\n");
    printf("cwde before : sValue :%d\tiValue :%d\n", sValue_1, iValue_1);
    printf("register : eax : 0x%x\n", iValue_2);

    check_cwde();
    printf("cwde before : sValue :%d\tiValue :%d\n", sValue_1, iValue_1);
    printf("register : eax : 0x%x\n", iValue_1);

    cValue_1 = -3;
    sValue_1 = -5;
    iValue_1 = -10;

    check_movsx_init();
    printf("[movsx]\n");
    printf("cValue_1 : %d / %x\n", cValue_1, cValue_1);
    printf("sValue_1 : %d / %x\n", sValue_1, sValue_1);
    printf("iValue_1 : %d / %x\n", iValue_1, iValue_1);

    check_movsx();
    printf("cValue_1 : %d / %x\n", cValue_1, cValue_1);
    printf("sValue_1 : %d / %x\n", sValue_1, sValue_1);
    printf("iValue_1 : %d / %x\n", iValue_1, iValue_1);

    cValue_1 = -3;
    sValue_1 = -5;
    iValue_1 = -10;

    check_movzx_init();
    printf("[movzx]\n");
    printf("cValue_1 : %d / %x\n", cValue_1, cValue_1);
    printf("sValue_1 : %d / %x\n", sValue_1, sValue_1);
    printf("iValue_1 : %d / %x\n", iValue_1, iValue_1);

    check_movzx();
    printf("cValue_1 : %d / %08x\n", cValue_1, cValue_1);
    printf("sValue_1 : %d / %08x\n", sValue_1, sValue_1);
    printf("iValue_1 : %d / %08x\n", iValue_1, iValue_1);

    std::cout << " ======================================================================= " << std::endl;
    //===== bit circulation

    cValue_1 = -32;
    printf("[rol]\n");
    printf("0번 rol : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_rol();
    printf("1번 rol : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_rol();
    printf("2번 rol : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());

    printf("[ror]\n");
    check_ror();
    printf("1번 ror : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_ror();
    printf("2번 ror : cValue_1 : %d\t / %s - 원래대로 돌아옴\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());


    cValue_1 = 32;
    printf("값 변경 : cValue_1 : %d\t\n", cValue_1);

    printf("[CF(Carry Flag) 레지스터 값이 1일 때 rcl]\n");
    check_cf_on_rcl();
    printf("1번째 rcl : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_on_rcl();
    printf("2번째 rcl : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_on_rcl();
    printf("3번째 rcl : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_on_rcl();
    printf("4번째 rcl : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_on_rcl();
    printf("5번째 rcl : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_on_rcl();
    printf("6번째 rcl : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_on_rcl();
    printf("7번째 rcl : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());

    cValue_1 = 32;
    printf("값 원상태로 복구 : cValue_1 : %d\t\n", cValue_1);

    printf("[CF(Carry Flag) 레지스터 값이 0일 때 rcl]\n");
    check_cf_off_rcl();
    printf("1번째 rcl : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_off_rcl();
    printf("2번째 rcl : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_off_rcl();
    printf("3번째 rcl : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_off_rcl();
    printf("4번째 rcl : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_off_rcl();
    printf("5번째 rcl : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_off_rcl();
    printf("6번째 rcl : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_off_rcl();
    printf("7번째 rcl : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());

    cValue_1 = 32;
    printf("값 원상태로 복구 : cValue_1 : %d\t\n", cValue_1);

    printf("[CF(Carry Flag) 레지스터 값이 1일 때 rcr]\n");
    check_cf_on_rcr();
    printf("1번째 rcr : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_on_rcr();
    printf("2번째 rcr : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_on_rcr();
    printf("3번째 rcr : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_on_rcr();
    printf("4번째 rcr : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_on_rcr();
    printf("5번째 rcr : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_on_rcr();
    printf("6번째 rcr : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_on_rcr();
    printf("7번째 rcr : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());

    cValue_1 = 32;
    printf("값 원상태로 복구 : cValue_1 : %d\t\n", cValue_1);

    printf("[CF(Carry Flag) 레지스터 값이 0일 때 rcr]\n");
    check_cf_off_rcr();
    printf("1번째 rcr : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_off_rcr();
    printf("2번째 rcr : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_off_rcr();
    printf("3번째 rcr : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_off_rcr();
    printf("4번째 rcr : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_off_rcr();
    printf("5번째 rcr : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_off_rcr();
    printf("6번째 rcr : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());
    check_cf_off_rcr();
    printf("7번째 rcr : cValue_1 : %d\t / %s\n", cValue_1, std::bitset<8>(cValue_1).to_string().c_str());


    std::cout << " ======================================================================= " << std::endl;

    return 0;
}