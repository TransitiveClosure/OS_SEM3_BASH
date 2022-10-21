#!/bin/bash

string=""
bufString=""
while [[ "$bufString" != "q" ]]
do
	string=$string$bufString
	read bufString
done
echo "$string"
