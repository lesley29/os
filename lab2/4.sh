#!/bin/bash
grep -E -shr '^#!\s*/\S+$' /etc | tr -d '[[:blank:]]' | awk -f 4.awk | tr -d '#!'