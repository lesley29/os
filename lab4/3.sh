#!/bin/bash
first_script=$HOME"/share/lab4/1.sh"
echo "*/5 * * * 1-5 $first_script" | crontab