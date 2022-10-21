#!/bin/bash
while true; do
    read line

    if [[ "$line" == "+" ]];
    then
        kill -USR1 $1
    fi

    if [[ "$line" == "*" ]];
    then
        kill -USR2 $1
    fi
    
    if [[ "$line" == "TERM" ]];
    then
        kill -TERM $1
        exit 0
    fi
done
