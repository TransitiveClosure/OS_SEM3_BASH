#!/bin/bash
num=1
MODE=" "
usr1()
{
    MODE="+"
}
usr2()
{
    MODE="*"
}
term()
{
    exit 0
}
trap 'usr1' USR1
trap 'usr2' USR2
trap 'term' TERM

while true; do
    case $MODE in
        "+")
            num=$(($num + 2))
            ;;
        "*")
            num=$(($num * 2))
            ;;
        *)
            ;;
    esac
    echo "$num"
    sleep 3;
done
