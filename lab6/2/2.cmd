echo %computername%

schtasks /Create /SC ONCE /TN "Copy large files to remote" /TR copy.cmd