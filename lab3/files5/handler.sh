#!/bin/bash
num=1
com="+"
( tail -f pipe ) |
while true; do
    read LINE;
    case $LINE in
        "+")
            com="+"
            ;;
        [*]*)
            com="*"
            ;;
        [0-9]*)
            case $com in 
                "+")
                    num=$(($num + $LINE))
					echo $num
                    ;;
                "*")
                    num=$(($num * $LINE))
					echo $num
                    ;;
            esac
            ;;
        "QUIT")
            echo "Exit"
            killall tail
            exit 0
            ;;
        *)
            killall tail
            echo "Incorrect input data"
            exit 1
            ;;
    esac
done
