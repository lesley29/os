#!/bin/bash
work_dir=$HOME"/share/lab4"
log=$work_dir"/report.txt"
new_dir=$work_dir/"test"
launch_date=$(date +%F_%H-%M-%S)

mkdir $new_dir && \
	{ \
		echo "catalog test was created successfully" > $log; \
		touch $new_dir/$launch_date; \
	}; \
ping www.net_nikogo.ru -c 1 -q 2>/dev/null || echo "host unavailable" >> $log