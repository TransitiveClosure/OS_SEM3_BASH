#!/bin/bash
for pid in $(ps -aux | awk '$8=="Z"{print $2}')
do
    path="/proc/"$pid
    ppid=$(grep -Ehsi "ppid:\s+" $path"/status" | awk '{print $2}')
    kill -KILL "$ppid"
done
