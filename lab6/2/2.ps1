# 1
HOSTNAME

# 2-3
$taskName = "Copy files greater than 2MB to remote"
schtasks /Create /SC ONCE /TN $taskName /TR copy.cmd /ST ((Get-Date).AddMinutes(1).ToString("HH:mm"))

# 4
Get-ScheduledTask | ? TaskName -eq $taskName | Select -ExpandProperty State