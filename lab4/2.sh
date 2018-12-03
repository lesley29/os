#!/bin/bash
first_script=$HOME"/share/lab4/1.sh"
file_to_monitor=$HOME"/share/lab4/report.txt"

at -f $first_script now +2 minutes -M
tail -f $file_to_monitor -n 0