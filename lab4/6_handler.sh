#!/bin/bash
echo $$ > .pid

custom_term()
{
	echo "SIGTERM from another process is received. Terminating..."
	exit 0
}

trap 'custom_term' SIGTERM

while :
do
	:
done