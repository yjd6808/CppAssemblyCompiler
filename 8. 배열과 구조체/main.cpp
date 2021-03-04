#include <iostream>
#include <stdint.h>
#include <bitset>
#include <ctime>

// 초기화된 배열
extern int arr[];
extern int arr_len;

extern int brr[];
extern int brr_len;

// 지역변수로서의 배열
extern void local_arr_test() asm("local_arr_test");

// esi, edi, lodsd, stosd 명령어 사용 - 매개변수 배열 사용
extern void esi_local_arr_test()                    asm("esi_local_arr_test");
extern void edi_param_arr_test(int _arr[], int len) asm("edi_param_arr_test");
extern void esi_param_arr_test(int _arr[], int len) asm("esi_param_arr_test");

// direction flag 확인
extern void direction_flag_local_arr_test()                     asm("direction_flag_local_arr_test");
extern void direction_flag_param_arr_test(int _arr[], int len)  asm("direction_flag_param_arr_test");

int main(int argc, char* argv[])
{
    time_t t = time(NULL);
    stime(&t);

    // 초기화된 배열
    printf("초기화된 배열\n");
    for (int i = 0; i < arr_len; i++)
        printf("%d\t", arr[i]);
    printf("\n======================\n");
    for (int i = 0; i < brr_len; i++)
        printf("%d\t", brr[i]);
    printf("\n======================\n");

    // 지역변수로서의 배열
    printf("지역변수로서의 배열\n");
    local_arr_test();
    printf("\n======================\n");

    // edi 명령어 사용 - 매개변수 배열 사용   
    printf("edi 명령어 사용 - 매개변수 배열 사용\n");
    int a[10] = {0, };

    edi_param_arr_test(a, 10);

    for (int i = 0; i < 10; i++)
        printf("%d ", a[i]);
    printf("\n======================\n");

    for (int i =0; i < 10; i++)
        a[i] = rand() % 100;

    // esi 명령어 사용 - 매개변수 배열 사용   
    printf("esi 명령어 사용 - 매개변수 배열 사용\n");
    esi_param_arr_test(a, 10);
    printf("\n======================\n");

    // esi 명령어 사용 - 지역변수 배열 사용
    printf("esi 명령어 사용 - 지역변수 배열 사용\n");
    esi_local_arr_test();

    // direction flag 확인
    printf("direction flag 확인 - 지역변수 배열 사용\n");
    direction_flag_local_arr_test();
    printf("\n======================\n");

    printf("direction flag 확인 - 매개변수 배열 사용\n");

    printf(">> 원본 배열 순서\n");
    for (int i = 0; i < 10; i++)
        printf("%d ", a[i]);
    printf("\n======================\n");
    printf(">> 반대로 읽기\n");
    direction_flag_param_arr_test(a, 10);
    printf("\n======================\n");
}