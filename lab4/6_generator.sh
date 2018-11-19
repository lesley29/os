#!/bin/bash
while :
do
	read line
	if [[ $line == "TERM" ]]; then
		kill $(cat .pid)
		exit 0
	fi
done