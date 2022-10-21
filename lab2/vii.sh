#!/bin/bash
for pid in $(ps -Ao pid | sed -n "2~1p");
do
    path="/proc/"$pid
    if [ -f $path/comm ]
    then
        com=$(awk '{print $1}' $path"/comm")
    fi

    if [ -f $path/io ]
    then
        readBytes=$(grep -Ehsi "rchar:\s+" $path"/io" | grep -Eo "[[:digit:]]+")
        if [[ -z $readBytes ]]
        then
            readBytes=0
        fi
        echo "$pid $com $readBytes"
    fi
done > bufVii1

sleep 1m

for pid in $(ps -axo  pid | sed -n "2~1p");
do
    path="/proc/"$pid
    if [ -f $path/comm ]
    then
        com=$(awk '{print $1}' $path"/comm")
    fi

    if [ -f $path/io ]
    then
        readBytes=$(grep -Ehsi "rchar:\s+" $path"/io" | grep -Eo "[[:digit:]]+")
        if [[ -z $readBytes ]]
        then
            readBytes=0
        fi
        echo "$pid $com $readBytes"
    fi
done > bufVii2
 
cat bufVii1 | while read line;
do
    pid=$(awk '{print $1}' <<< "$line")
    com=$(awk '{print $2}' <<< "$line")
    readBytesOld=$(awk '{print $3}' <<< "$line")
    readBytesNew=$(cat bufVii2 | awk -v id="$pid" '$1==id {print $3}')  
    diffByte=$(echo "$readBytesNew - $readBytesOld" | bc)
    echo "$pid : $com : $diffByte"
done | sort -r -nk5 > file7
head -n 3 "file7"
