$file = "DRIVERS.txt"
#1
Get-WindowsDriver -Online `
	| Format-Table -Property Driver,ClassName,ProviderName,Version `
	| Out-File $file
	
#2
Get-Content $file | Select -Skip 3 | ForEach-Object {
    $Line = $_.Trim() -Split '\s+'

    New-Object -TypeName PSCustomObject -Property @{
        Driver = $Line[0]
        ClassName = $Line[1]
        ProviderName = $Line[2]
        Version = $Line[3]
    }

} | Sort-Object Driver -Descending