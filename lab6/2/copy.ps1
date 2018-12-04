# $src = "cd\"
# $dst = "\\$env:COMPUTERNAME\temp"
$src = "from"
$dst = "to"
robocopy /Z /min:2097152 $src $dst