#!/bin/bash
grep -shr --include="*.log" ".*" /var/log | wc -l