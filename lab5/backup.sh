#!/bin/bash
set -o pipefail
target="/home/user/share/lab5/backup"
prefix="Backup"
src_dir="/home/user/share/lab5/backup/source"
log="/home/user/share/lab5/backup/backup-report.txt"

date_diff_days()
{
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo $(( (d1 - d2) / 86400 ))
}

latest=$(ls $target | grep -E "^$prefix-[0-9]{4}-[0-9]{2}-[0-9]{2}$" | cut -d '-' -f 2-4 | sort -t '-' -k1 -k2 -k3 -r | head -n 1)
dst_dir="$target/$prefix-$latest"

now=$(date +"%Y-%m-%d")
if [[ ! -z "$latest" ]]; then
	diff=$(date_diff_days $now $latest)
fi

new=0
if [[ -z "$latest" || "$diff" -ge 7 ]]; then
	new=1
	dst_dir="$target/$prefix-$now"
	mkdir $dst_dir
	echo "New backup directory has created \"$prefix-$now\"" >> $log
fi

if [[ $new -eq 0 ]]; then
	echo "Updating existing backup directory $prefix-$latest at $now" >> $log
fi

for file in $(ls $src_dir); do
	src_file="$src_dir/$file"
	dst_file="$dst_dir/$file"
	if [[ $new -eq 1 ]]; then 
		cp $src_file $dst_dir
		echo $file >> $log
		continue
	else
		if [[ ! -f $dst_file ]]; then
			cp $src_file $dst_dir
			echo "New file copied \"$file\"" >> $log
		else
			first=$(stat "$dst_file" --printf="%s")
			second=$(stat $src_file --printf="%s")
			if [[ $first -eq $second ]]; then
				continue
			fi
			mv $dst_file "$dst_file.$now"
			cp $src_file $dst_dir
			echo "New version of file $file found. Previous version has been renamed to $file.$now" >> $log
		fi
	fi
done