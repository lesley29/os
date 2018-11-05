#!/bin/bash
for pid in $(ps -e -o pid --no-headers)
do
	ppid=$(grep -s "PPid" /proc/$pid/status | cut -d : -f 2)
	avg_atom=$(grep -s "avg_atom" /proc/$pid/sched | cut -d : -f 2)
	if [ -z $ppid ] || [ -z $avg_atom ]; then
		continue
	fi
	echo "ProcessID="$pid" : Parent_ProcessID=!"$ppid"! : Average_Time="$avg_atom""
done