#!/bin/bash
awk -f 5.awk /etc/passwd | sort -n -k2