#!/bin/bash
text=$(ps -o pid,comm -U user | sed -n '2~1p')
echo "$text" | wc -l > file1
echo "$text" >> file1