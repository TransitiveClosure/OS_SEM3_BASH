#!/bin/bash

count=0
sum=0
lastPpid=0
echo "" > file5
while read line
do
    pid=$(awk -F"=" '{print $2}' <<< "$line" | grep -Eo "[[:digit:]]+")
    ppid=$(awk '{print $3}' <<< "$line" | grep -Eo "[[:digit:]]+")
    art=$(awk '{print $5}' <<< "$line" | grep -Eo "[[:digit:]]*\.*[[:digit:]]+")
    if [[ "$lastPpid" != "$ppid" ]]
    then
        aver=$(echo "scale=5 ; $sum/$count" | bc)
        echo "Average_Running_Children_of_ParentID=${lastPpid} is ${aver}" >> file5
        sum="$art"
        count="1"
    else
        sum=$(echo "$sum + $art" | bc)
        count=$(echo "$count + 1" | bc)
    fi
    echo "ProcessID=${pid} : Parent_ProcessID=${ppid} : Average_Running_Time=${art}" >> file5
    lastPpid="$ppid"
done < file4