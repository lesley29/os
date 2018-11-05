#!/bin/bash
ps -u user -o pid,cmd --no-headers c | sed -r "s/^\s+//" | tr [:blank:] : > 1.txt