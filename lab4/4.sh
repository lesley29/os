#!/bin/bash
loop="./4_loop.sh"

$loop &
pid1=$!

$loop &
pid2=$!

echo $pid1 $pid2

renice -n 7 -p $pid1

sleep 25
kill $pid1
kill $pid2