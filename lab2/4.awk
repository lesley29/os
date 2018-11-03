{ data[$1]++; }
END {
	result;
	max = 0;
	for (d in data) 
	{
		if (data[d] > max){
			result = d;
			max = data[d];
		}
	}
	print result;
}