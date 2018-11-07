#!/bin/bash
old_file="5.txt"
cat 5.txt | tr -d [:alpha:]_:= | awk -f 6.awk > tmp.txt
cat tmp.txt > $old_file
rm -f tmp.txt