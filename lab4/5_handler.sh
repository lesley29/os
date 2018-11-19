#!/bin/bash
op='+'
val=1

(tail -n 0 -f data.txt) | while : ; do
	read line
	case $line in
		QUIT )
			echo $val
			echo "exit"
			pkill -g 0
			exit 0 
		;;
		'x' )
			op='x'
		;;
		'+' )
			op='+'
		;;
		*[!0-9]*|"" )
			echo "Invalid argument"
			exit 1
		;;
		* )
			if [[ $op == '+' ]]; then
				let val=$val+$line
			else
				let val=$val*$line
			fi
		;;
	esac
done