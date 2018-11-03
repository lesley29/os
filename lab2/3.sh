#!/bin/bash
pattern="[a-zA-Z0-9._-]+@[[:alpha:]]+(\.[[:alpha:]]+)+"
grep -E -shr $pattern /etc | sed -r "s/^.*\s($pattern)\s.*/\1/" | tr -s "\n" "," | sed "s/.$//" > emails.lst