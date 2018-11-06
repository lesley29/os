#!/bin/bash
#cut -d : -f 2-3 5.txt | tr -d [:alpha:]_:= | awk -f 6.awk
old_file="5.txt"
cat 5.txt | tr -d [:alpha:]_:= | awk -f 6.awk | sort -n -k2 -t ! | tr -d ! > tmp.txt
cat tmp.txt > $old_file
rm -f tmp.txt