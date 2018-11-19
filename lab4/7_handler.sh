#!/bin/bash
echo $$ > .pid
op='+'
val=1

custom_term()
{
	echo "SIGTERM from another process is received. Terminating..."
	exit 0
}

usr1()
{
	op='+'
}

usr2()
{
	op='x'
}

trap 'custom_term' SIGTERM
trap 'usr1' USR1
trap 'usr2' USR2

while :
do
	if [[ $op == '+' ]]; then
		let val=$val+2
	else
		let val=$val*2
	fi
	echo $val
	sleep 1
done