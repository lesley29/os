#!/bin/bash
ps ef -o pid,command | grep "/sbin/" | grep -E -o '^\s+([[:digit:]]+)\b' > 3.txt