#!/bin/bash

currentData=$(date +"%d:%B:%Y;%T")
mkdir ~/test 2>/dev/null && { echo "catalog test was created successfully" >> ~/report ; touch ~/test/"$currentData" ;} 
ping www.net_nikogo.ru 2>/dev/null || echo "${currentData}; host unreachable" >> ~/report ;