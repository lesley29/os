#!/bin/bash
while :
do
	read -r line
	echo "${line}" >> data.txt
	if [[ $line == "QUIT" ]]; then
		exit 0
	fi
done