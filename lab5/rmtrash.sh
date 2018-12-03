#!/bin/bash
exec 2>/dev/null
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

raise_error()
{
	echo "An error occured: $1"
	exit 1
}

if [[ ! -d $trash ]]; then
	mkdir $trash
fi

link_name="link_"$(get_next_link_name)
ln $file "$trash/$link_name" && rm -f $file || raise_error "there is no such file or something wrong with permissions"
echo "$file : $link_name" >> "$pseudo_home/.trash.log"

# cp /home/user/share/lab5/rmtrash.sh /home/user/lab5