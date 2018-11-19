#!/bin/bash
target_pid=$(cat .pid)
while :
do
	read line
	case $line in
		TERM )
			kill $target_pid
			exit 0
		;;
		'+' )
			kill -USR1 $target_pid
		;;
		'x' )
			kill -USR2 $target_pid
		;;
		* )
			continue
		;;
	esac
done