{ 
	cnt[$2]++;
	sum[$2] += $3;
	relation[$1] = $2;
	pid_avg[$1] = $3;
}
END {
	for (pid in relation){
		ppid = relation[pid]
		print "ProcessID="pid" : Parent_ProcessID=!"ppid"! : Average_Time="pid_avg[pid]" : Average_Sleeping_Children_of_ParentID="ppid" is "sum[ppid]/cnt[ppid];
	}
}