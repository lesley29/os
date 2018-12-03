#!/bin/bash
set -o pipefail
exec 2>/dev/null
pseudo_home="/home/user/lab5"
trash_log="$pseudo_home/.trash.log"
trash="$pseudo_home/trash"

handle_yes()
{
	local dst=$1
	local link=$2
	
	src=$(echo "$trash/$link" | tr -d '[:blank:]') || raise_error "Problems with trash dir"
	if [[ ! -d $(dirname $dst) ]]; then
		dst="$pseudo_home/"$(basename $dst)
		echo "Restoring to $dst..."
	fi

	ln -T $src $dst && rm -f $src || raise_error "Problems with trash dir or dst dir"
	sed -ni "\^$link^d" $trash_log
}

raise_error()
{
	echo "An error occured: $1"
	exit 1
}

[[ -z $1 ]] && raise_error "Incorrect input"
result=$(grep -E "/[[:alnum:]_.-]*$1[[:alnum:]_.-]*[[:blank:]]" $trash_log | tr -d ':') || raise_error "Problems with log file"
IFS=$(echo -en "\n\b")
for line in $result; do
	file=$(echo $line | awk '{print $1}')
	link=$(echo $line | awk '{print $2}')
	while : ; do
		printf "Untrash the following file $file? (y/n)"
		read -n 1 -r answer; echo
		if [[ $answer == 'y' ]]; then
			handle_yes "$file" "$link"
			break
		elif [[ $answer == 'n' ]]; then
			break
		else
			echo "Please use y or n"
			continue
		fi
	done
done
