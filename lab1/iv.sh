#!/bin/bash

path=pwd
if [[ "$PWD" == "$HOME" ]]
then
	echo "$PWD"
	exit 000
else
	echo "Error: user is not at home!"
	exit 001
fi
