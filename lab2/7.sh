#!/bin/bash
man bash \
	| col -b \
	| grep -E -o "[[:alpha:]]{4,}" \
	| awk -f 7.awk \
	| sort -nr -k2 \
	| head -n 3