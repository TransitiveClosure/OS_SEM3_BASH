#!/bin/bash

sh ./infLoop.sh &
proc1=$!
sh ./infLoop.sh &
proc2=$!
sh ./infLoop.sh &
proc3=$!

renice +42 -p "$proc1"