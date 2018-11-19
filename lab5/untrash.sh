#!/bin/bash
pseudo_home="/home/user/lab5"
trash_log="$pseudo_home/.trash.log"
trash="$pseudo_home/trash"

handle_yes()
{
	local dst=$1
	local link=$2
	
	src=$(echo "$trash/$link" | tr -d '[:blank:]')
	if [[ ! -d $(dirname $dst) ]]; then
		dst="$pseudo_home/"$(basename $dst)
		echo "Restoring to $dst..."
	fi

	ln -T $src $dst
	rm -f $src
	sed -ni "\^$arr^d" $trash_log
}

IFS=':'
grep -E "/[[:alnum:]_.-]*$1[[:alnum:]_.-]*[[:blank:]]" $trash_log | while read -ra arr ; do
	while : ; do
		read -n1 -p "Untrash the following file ${arr[0]}? (y/n)" answer < /dev/tty; echo
		if [[ $answer == 'y' ]]; then
			handle_yes "${arr[0]}" "${arr[1]}"
			break
		elif [[ $answer == 'n' ]]; then
			break
		else
			echo "Please use y or n"
			continue
		fi
	done
done
unset IFS