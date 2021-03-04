#include <iostream>
#include <stdint.h>
#include <bitset>

// push, pop 명령어
extern void push_pop_test() asm("push_pop_test");

int a, b, c;
int pop_a, pop_b, pop_c;
unsigned int current_stack_pos, esp_a, esp_b, esp_c, esp_pop_a, esp_pop_b, esp_pop_c;
unsigned int esp_d, esp_e;

// call ret 명령어
extern void ct_main() asm("ct_main");
extern void ct_a() asm("ct_a");
extern void ct_b() asm("ct_b");
extern void ct_c() asm("ct_c");

int ct_sa, ct_sb, ct_sc;
int ct_ra, ct_rb, ct_rc;

// 매개변수 전달
extern void add(int a, int b) asm("add");
extern void asm_add() asm("asm_add");

int result;

// ebp 명령어
extern void ebp_test() asm("ebp_test");

int ebp_a, ebp_b, ebp_c, ebp_d, ebp_e, ebp_f;

int main(int argc, char* argv[])
{
    // push, pop 명령어

    push_pop_test();
    
    printf("stack_position : %u\n", current_stack_pos);
    printf("a : %d / %u\n", a, esp_a);
    printf("b : %d / %u\n", b, esp_b);
    printf("c : %d / %u\n", c, esp_c);

    printf("pop_c : %d / %u\n", pop_c, esp_pop_c);
    printf("pop_b : %d / %u\n", pop_b, esp_pop_b);
    printf("pop_a : %d / %u\n", pop_a, esp_pop_a);

    std::cout << "=====================" << std::endl;
    std::cout << "call ret 명령어" << std::endl;

    // call ret 명령어
    ct_main();

    printf("main : %p\n", ct_main);
    std::cout << "=====================" << std::endl;
    printf("a : %p\n", ct_a);
    printf("b : %p\n", ct_b);
    printf("c : %p\n", ct_c);
    std::cout << "=====================" << std::endl;
    printf("a : %x\n", ct_sa);
    printf("b : %x\n", ct_sb);
    printf("c : %x\n", ct_sc);
    std::cout << "=====================" << std::endl;
    printf("ra : %x\n", ct_ra);
    printf("rb : %x\n", ct_rb);
    printf("rc : %x\n", ct_rc);

    std::cout << "=====================" << std::endl;
    std::cout << "매개변수 전달" << std::endl;

    int a = 3;
    int b = 4;
    add(a + 1, b);
    printf("result : %d\n", result);

    asm_add();
    printf("result : %d\n", result);

    printf("esp_a : %u\n", esp_a);
    printf("esp_b : %u\n", esp_b);
    printf("esp_c : %u\n", esp_c);
    printf("esp_d : %u\n", esp_d);
    printf("esp_e : %u\n", esp_e);

    std::cout << "=====================" << std::endl;
    std::cout << "ebp 명령어 사용" << std::endl;

    ebp_test();

    printf("ebp_test    함수의 스택포인터 : %x\n", ebp_d);
    printf("ebp_test_2  함수의 스택포인터 : %x\n", ebp_e);
    printf("ebp_a : %d\n", ebp_a);
    printf("ebp_b : %d\n", ebp_b);
    printf("ebp_c : %d\n", ebp_c);
    
}
