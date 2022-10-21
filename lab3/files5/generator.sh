#!/bin/bash
while true; do
    read line
    echo "$line" > pipe

    if [[ "$line" == "QUIT" ]];
    then
        echo "Programm stopped"
        exit 0
    fi

    if [[ "$line" != "+" && "$line" != "*" && ! "$line" =~ [0-9]+ ]];
    then
        echo "Incorrect input data"
        exit 1
    fi
done
