#!/bin/bash

while :
do
	echo -e "MENU\nChoose option\n1 - open file in nano\n2 - open file in vim\n3 - open URL in links\n4 - exit"
	read num
	if [[ "$num" == "1" ]]
	then
		read name
		nano "$name"
		break
	fi
	if [[ "$num" == "2" ]]
	then
		read name
		vi "$name"
		break
	fi
	if [[ "$num" == "3" ]]
	then
		read name
		links "$name"
		break
	fi
	if [[ "$num" == "4" ]]
	then
		break
	fi
done
