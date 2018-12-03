#!/bin/bash
exec 2>/dev/null
restore="/home/user/share/lab5/backup/restore"
backup_root_dir="/home/user/share/lab5/backup"
prefix="Backup"

latest=$(ls $backup_root_dir | grep -E "^$prefix-[0-9]{4}-[0-9]{2}-[0-9]{2}$" | cut -d '-' -f 2-4 | sort -t '-' -k1 -k2 -k3 -r | head -n 1)
if [[ -z $latest ]]; then
	echo "Nothing to restore"
	exit 0
else
	latest_dir="$backup_root_dir/$prefix-$latest"
	for file in $(ls $latest_dir | grep -E -v ".[0-9]{4}-[0-9]{2}-[0-9]{2}"); do
		cp "$latest_dir/$file" $restore
	done
fi
