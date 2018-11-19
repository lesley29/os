#!/bin/bash
file="$PWD/$1"
pseudo_home="/home/user/lab5"
trash="$pseudo_home/trash"

get_next_link_name()
{
	local last=$(ls $trash | cut -d '_' -f 2 | sort -V -r | head -n 1)
	if [[ -z $last ]]; then
		echo 0
	else
		echo `expr $last + 1`
	fi
}

if [[ ! -d $trash ]]; then
	mkdir $trash
fi

link_name="link_"$(get_next_link_name)
ln $file "$trash/$link_name"
rm -f $file

echo "$file : $link_name" >> "$pseudo_home/.trash.log"
# cp /home/user/share/lab5/rmtrash.sh /home/user/lab5
