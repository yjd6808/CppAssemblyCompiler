#! /bin/bash

# 작성자 : 윤정도
# 작성일 : 2021-01-20 (수)
# 목적   : 리눅스 C++ & 어셈블리어 통합 빌드용

# 아키텍쳐
arch="elf64"

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
build_directory="6. test9"




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

ls | grep "\.o" | xargs rm > /dev/null #오브젝트 파일 정리
ls | grep "$result_filename" | xargs rm > /dev/null #실행파일 정리

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

for file in ${arr_cpp_files[@]} ; do
    $compiler -c $file

    if [ $? -ne 0 ] ; then
        exit -1
    fi
done

    echo -e "${COLOR_LOGO}"
    echo =================================================
    echo "어셈블리 컴파일"
    echo =================================================
    echo -e "${COLOR_DEFAULT}"

#asm 파일 컴파일
for file in $arr_asm_files ; do
    $assembler -f $arch $file

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

$compiler -o $result_filename $object_files

if [[ $? -ne 0 ]] ; then
    echo 빌드 실패
else
    echo 빌드 성공
fi