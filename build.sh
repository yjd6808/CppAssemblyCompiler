#! /bin/bash

# 작성자 : 윤정도
# 작성일 : 2021-01-20 (수)
# 목적   : 리눅스 C++ & 어셈블리어 통합 빌드용

# 아키텍쳐
# 32 : 32비트 프로그램 아키텍쳐
# 64 : 64비트 프로그램 아키텍쳐
arch="32"

# C 코드 어셈블리 코드로 변환할지
generate_assembly_code=1

# C & CPP 컴파일러
compiler="g++"

# 어셈블러
assembler="nasm"

# 빌드 디렉토리
#build_directory="_temp"
#build_directory="1. CPP와 어셈블리 파일 통합 컴파일"
#build_directory="2. 기본연산"
#build_directory="3. 데이터 저장형식"
#build_directory="4. 역수, 곱셈, 나눗셈"
#build_directory="4. test1"
#build_directory="4. test2"
#build_directory="4. test3"
#build_directory="4. test4"
#build_directory="5. 비트 데이터"
#build_directory="5. test1"
#build_directory="5. test2"
#build_directory="5. test3"
#build_directory="5. test5"
#build_directory="5. test6"
#build_directory="5. test7"
#build_directory="5. test8"
#build_directory="5. test13"
#build_directory="6. 비교와 반복"
#build_directory="6. test1"
#build_directory="6. test2"
#build_directory="6. test3"
#build_directory="6. test4"
#build_directory="6. test5"
#build_directory="6. test6"
#build_directory="6. test7"
#build_directory="6. test8"
#build_directory="6. test9"
#build_directory="6. test10"
#build_directory="6. test11"
#build_directory="6. test12"
#build_directory="6. test14"
#build_directory="6. test15"
#build_directory="6. test16"
#build_directory="7. 함수"
#build_directory="7. test1"
#build_directory="7. test2"
#build_directory="7. test3"
#build_directory="7. test4"
#build_directory="7. test5"
#build_directory="7. test6"
#build_directory="7. test7"
#build_directory="7. test8"
#build_directory="7. test9"
#build_directory="7. test10"
#build_directory="7. test11"
#build_directory="7. test12"
#build_directory="7. test13"
#build_directory="7. test14"
#build_directory="7. test16"
#build_directory="7. test17"
#build_directory="7. test19"
#build_directory="7. test20"
#build_directory="7. test21"
#build_directory="7. test22"
#build_directory="7. test23"
#build_directory="7. test24"
#build_directory="7. test25"
#build_directory="7. test27"
build_directory="8. 배열과 구조체"


# 실행파일
result_filename="main.exe"

# 로고 색
COLOR_LOGO='\033[1;33m'
COLOR_DEFAULT='\033[0m'

# 문자열 비교시 대소문자 무시
shopt -s nocasematch 
cd "${build_directory}"

    echo -e "${COLOR_LOGO}"
    echo =================================================
    echo "오브젝트 및 실행파일 정리"
    echo =================================================; 
    echo -e "${COLOR_DEFAULT}"

ls | grep -q "\.o" | xargs rm > /dev/null #오브젝트 파일 정리
ls | grep -q "\.lst" | xargs rm > /dev/null
ls | grep -q "\.out" | xargs rm > /dev/null
ls | grep -q "\.s" | xargs rm > /dev/null
ls | grep -q "$result_filename" | xargs rm > /dev/null #실행파일 정리


files=$(ls)
arr_cpp_files=()
arr_asm_files=()

    echo -e "${COLOR_LOGO}"
    echo =================================================
    echo "CPP 파일 및 어셈블리 파일 수집"
    echo =================================================
    echo -e "${COLOR_DEFAULT}"

for file in $files ; do
    if [[ $file == *".cpp"* ]] ; then
        arr_cpp_files+=("$file")
        echo "CPP 파일 : " $file
    fi
done

for file in $files ; do
    if [[ $file == *".asm"* ]] ; then
        arr_asm_files+=($file)
        echo "어셈블리 파일 : " $file
    fi
done

    echo -e "${COLOR_LOGO}"
    echo =================================================
    echo "CPP 컴파일"
    echo =================================================
    echo -e "${COLOR_DEFAULT}"

cpp_arch=""

if [ $arch -eq 32 ] ; then
    cpp_arch="-m32"
else
    cpp_arch="-m64"
fi

for file in ${arr_cpp_files[@]} ; do
    (set -x; $compiler $cpp_arch -c $file)

    if [ $? -ne 0 ] ; then
        exit -1
    fi
done

if [ $generate_assembly_code -eq 1 ] ; then
    for file in ${arr_cpp_files[@]} ; do
        pure_generated_assembly_file=$(echo $file | sed 's/.cpp//gi')
        pure_generated_assembly_file+='.s'

        # (set -x; $compiler -S -fverbose-asm -g -O2 $file -o $pure_generated_assembly_file)
        (set -x; $compiler -S -g -masm=intel $file -o $pure_generated_assembly_file)

        generated_assembly_file=$(echo $file | sed 's/.cpp//gi')
        generated_assembly_file+='.lst'

        (set -x; as -alhnd $pure_generated_assembly_file > $generated_assembly_file)


        if [ $? -ne 0 ] ; then
            exit -1
        fi
    done
fi

    echo -e "${COLOR_LOGO}"
    echo =================================================
    echo "어셈블리 컴파일"
    echo =================================================
    echo -e "${COLOR_DEFAULT}"

asm_arch=""
if [ $arch -eq 32 ] ; then
    asm_arch="elf32"
else
    asm_arch="elf64"
fi

#asm 파일 컴파일
for file in $arr_asm_files ; do
    (set -x; $assembler -f $asm_arch $file)

    if [ $? -ne 0 ] ; then
        exit -1
    fi
done

object_files=()

#오브젝트 파일 수집
#sed '치환/변경되는 문자열/변경될 문자열/대소문자 무시
for file in "${arr_cpp_files[@]}" "${arr_asm_files[@]}" ; do
    file=$(echo $file | sed 's/.cpp//gi')
    file=$(echo $file | sed 's/.asm//gi')
    file+='.o'
    file+=" "
    object_files+=$file
done

    echo -e "${COLOR_LOGO}"
    echo =================================================
    echo "링크"
    echo =================================================
    echo -e "${COLOR_DEFAULT}"

    (set -x; $compiler -o $result_filename $object_files $cpp_arch)



if [[ $? -ne 0 ]] ; then
    echo -e "${COLOR_LOGO}"
    echo $build_directory "빌드 실패"
    echo -e "${COLOR_DEFAULT}"
else
    echo -e "${COLOR_LOGO}"
    echo $build_directory "빌드 성공"
    echo -e "${COLOR_DEFAULT}"
fi

ls | grep "\.o" | xargs rm > /dev/null #오브젝트 파일 정리
ls | grep "\.out" | xargs rm > /dev/null
