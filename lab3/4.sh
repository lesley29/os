#!/bin/bash
ps -e -o pid --no-headers | awk -f 4.awk | sort -n -t : -r -k2 > 4.txt