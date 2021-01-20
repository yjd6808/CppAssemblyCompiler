#! /bin/bash

# 작성자 : 윤정도
# 작성일 : 2021-01-20 (수)
# 목적   : 리눅스 C++ & 어셈블리어 통합 빌드용

# 아키텍쳐
arch="elf64"

# 실행파일
result_filename="main.exe"

# 로고 색
COLOR_LOGO='\033[1;33m'
COLOR_DEFAULT='\033[0m'

# 문자열 비교시 대소문자 무시
shopt -s nocasematch 



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
    gcc -c $file

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
    nasm -f $arch $file

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

gcc -o $result_filename $object_files

if [[ $? -ne 0 ]] ; then
    echo 빌드 실패
else
    echo 빌드 성공
fi