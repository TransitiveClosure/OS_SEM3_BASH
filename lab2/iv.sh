#!/bin/bash
for pid in $(ps -Ao pid | sed -n "2~1p")
do
    path="/proc/"$pid
    ppid=$(grep -Ehsi "ppid:\s+" $path"/status" | awk '{print $2}')
    ser=$(grep -Ehsi "se\.sum_exec_runtime\s+:\s+" $path"/sched" | awk '{print $3}')
    nrs=$(grep -Ehsi "nr_switches\s+:\s+" $path"/sched" | awk '{print $3}')
    if [[ -z "$ppid" ]]
    then
        ppid=0
    fi

    if [ -z $nrs ] | [ -z $ser ]
    then
        art=0
    else
        art=$(echo "scale=5 ; $ser / $nrs" | bc)
    fi    
    echo "${pid}, ${ppid}, ${art}"
done | sort -nk2 | awk '{print "ProcessID="$1" : Parent_ProcessID="$2" : Average_Running_Time="$3}' > file4