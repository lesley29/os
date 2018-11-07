#!/bin/bash
# pid for all processes using lib
for pid in $(ps -e -o pid --no-headers)
do
	result=$(grep -s -o "/lib/" /proc/$pid/maps)
	if [[ ! -z $result ]]; then
		echo $pid
	fi
done