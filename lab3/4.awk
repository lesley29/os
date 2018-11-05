{ 
	file="/proc/"$1"/statm";
	getline line < file;
	split(line, arr, " ");
	diff = arr[2] - arr[3]
	print ""$1":"diff""
	close(file);
}