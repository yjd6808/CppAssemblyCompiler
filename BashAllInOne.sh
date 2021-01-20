#! /bin/bash

# Author        :   윤정도
# Date          :   2021 - 01 - 18 (월)
# Description   :   리눅스 쉘 스크립트 튜토리얼 기록용입니다.
# Hint          :   sh BaseAllInOne.sh로 실행하지 말고 PS4='Line ${LINENO}: ' bash -x BaseAllInOne.sh로 실행하면 라인번호까지 출력됨

echo ========================================================
echo 1. 출력
echo ========================================================

echo "Hello World"

# ========================================================
# 2. 일반 변수
# ========================================================

a=1
b='c'
c="abcd"

arr1=("1",2,3)
echo "$a"
echo "$b"
echo "$c"

echo ${arr1[0]} ${arr1[1]} ${arr1[2]}

# ========================================================
# 3. 특수 변수
# ========================================================

# $0            : 파일 이름 출력
# $1, $2, $3    : 넘어온 인자
# $#            : 넘어온 인자 갯수
# $*            : 만약 넘어온 인자가 one two -> "one two" 와 같음
# $@            : 만약 넘어온 인자가 one two -> "one" "two" 와 같음
# $?            : 마지막 명령의 실행 결과값 정수
# $$            : 이 스크립트를 실행중인 bash의 프로세스 ID
# $!            : 마지막 백그라운드 명령의 프로세스 ID? 뭔말이지 ㅋㅋ

echo "$0"
echo "$1 $2"
echo "$#"
echo "$*"
echo "$@"
echo "$?"
echo "$$"
echo "$!"

# ========================================================
# 4. 기본 연산
# ========================================================
# 숫자 옆의 `로 감싸줘야함

val=`expr 4 + 22`
echo $val

val=`expr 10 / 22`
echo $val

val=`expr 10 % 3`
echo $val

val1=30
val2=10
val3=`expr $val1 / $val2`
echo $val3

# ========================================================
# 5. 관계 연산과 if문
# ========================================================
# 뛰어쓰기 주의해야함

# -eq, ==     : 같은가?
# -ne, !=     : 틀린가?
# -gt         : 큰가?
# -lt         : 작은가?
# -ge         : 크거나 같은가?
# -le         : 작거나 같은가?

val=100
val2=200

echo `expr $val1 != $val2`

if [ 1 -eq 2 ]
then
    echo 1이랑 2랑 같다.
else
    echo 1이랑 2랑 틀리다.
fi

# ========================================================
# 6. Boolean 연산
# ========================================================

# !     : not
# -o    : or
# -a    : and

val1=1
if [ ! $val1 ]
then
    echo val1 = false
else
    echo val1 = true
fi

val1=1
val2=0

if [ $val1 -gt $val2 -a $val2 -gt $val1 ]
then
    echo gogo
elif [ $val1 -gt $val2 ]
then
    echo nice!
else
    echo not go
fi

# ========================================================
# 7. 입력
# ========================================================

echo 입력은 아래 주석을 해제하고 실행해주세요!

#echo 당신의 이름을 입력하시오 : 
#read my_name
#echo 당신의 이름은 : $my_name입니다.


# ========================================================
# 8. for문
# ========================================================d

# while
# for
# until : if와 반대 내용이 참이 될때까지 반복
# select : 목록중에 선택 입력을 자동으로 받음

# (()) 이중괄호로 편하게 연산 가능

for ((i = 0; i < 100; i++))
{
    ((i > 80)) && break && echo 탈출
    ((i > 50)) && continue
    echo $i
}

for file in *
{
    echo $file
}

i=0

until ((i > 10))
do
   echo $i
   ((i += 1))
done


# PS3="Please make a choice => " ; export PS3
# select DRINK in tea cofee water juice appe all none; do
#    case $DRINK in
#       tea|cofee|water|all) 
#          echo "Go to canteen"
#         ;;
#       juice|appe)
#          echo "Available at home"
#         ;;   
#       none) 
#          break 
#         ;;
#       *) echo "ERROR: Invalid selection" 
#         ;;
#    esac
# done