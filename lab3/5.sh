#!/bin/bash
./5_aux.sh | sort -n -k2 -t ! | tr -d ! | sed -r "s/=\s/=/g" > 5.txt