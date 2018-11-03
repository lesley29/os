{ 
	for (i = 1; i <= NF; i++)
	{
		w = tolower($i)
		data[w]++; 
	}
}
END {
	for (d in data) 
	{
		print d, data[d]
	}
}