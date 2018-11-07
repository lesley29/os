BEGIN {
	previoud_ppid = 0;
	sum = 0;
	cnt = 0;
}
{
	if (previoud_ppid != $2){
		print "Average_Sleeping_Children_of_ParentID="previoud_ppid" is "sum/cnt;
		sum = 0;
		cnt = 0;
		previoud_ppid = $2;
	}
	cnt++;
	sum += $3;
	print "ProcessID="$1" : Parent_ProcessID="$2" : Average_Time="$3;
}
END {
	print "Average_Sleeping_Children_of_ParentID="previoud_ppid" is "sum/cnt;
}