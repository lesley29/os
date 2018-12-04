$first = "running_services.txt"
$second = "running_services_no_dns.txt"
$dns = "DNS client"

# 1
Get-Service | ? Status -eq "Running" | Out-File $first

# 2
Get-Service -DisplayName $dns | Stop-Service
Get-Service | ? Status -eq "Running" | Out-File $second
Compare-Object (get-content $first) (get-content $second) | Out-File "diff.txt"
Get-Service -DisplayName $dns | Start-Service

