#!/bin/bash
max=0
for pid in $(ps -Ao pid | sed -n "2~1p" | awk '{print $1}');
do
    vmRss=$(grep -Ehsi "VmRSS:\s+" "/proc/${pid}/status" | grep -Eo "[[:digit:]]+")
    if [ -z "$vmRss" ]
    then
        vmRss=0
    fi
    if [[ "$vmRss" -gt "$max" ]]
    then 
        max="$vmRss"
    fi
done
topMem=$(top -b -n 1 | tail -n +8 | sort -n -r -k 10 | head -1 | awk '{print $6}')
echo "This program max: ${max}; top results: ${topMem}"