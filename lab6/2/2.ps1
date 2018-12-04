$workDir = "D:\Data\Projects\university\os\lab6\2"
# 1
HOSTNAME

# 2-3
$taskName = "OS lab 6"

$delay = New-TimeSpan -Minutes 1
$now = (Get-Date).AddSeconds(1).ToString("HH:mm:ss")
$trigger = New-ScheduledTaskTrigger -Once -At $now -RandomDelay $delay
$action = New-ScheduledTaskAction -Execute copy.cmd -WorkingDirectory $workDir
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries
$task = New-ScheduledTask -Action $action -Trigger $trigger -Settings $settings
Register-ScheduledTask -TaskName $taskName -InputObject $task

# 4
# Start-Sleep -Seconds 2
Get-ScheduledTask -TaskName $taskName | ? State -eq running | Stop-ScheduledTask

# 5-6
$srcFile = "from\adas.txt"
$dstFile = "to\adas.txt"
if ((Get-FileHash $srcFile).Hash -ne (Get-FileHash $dstFile).Hash)
{
	.\copy.ps1
}