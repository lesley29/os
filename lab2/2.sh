#!/bin/bash
src='/var/log/Xorg.0.log'
out='./full.log'
info='(II)'
warn='(WW)'
grep -sh $info $src | sed "s/$info/Information:/" > $out
grep -sh $warn $src | sed "s/$warn/Warning:/" >> $out