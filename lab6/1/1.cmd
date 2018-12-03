echo OFF
setlocal enabledelayedexpansion
set workdir=workdir

ver > %workdir%\version.txt
wmic OS GET FreePhysicalMemory, TotalVisibleMemorySize | more > %workdir%\memory.txt
wmic LOGICALDISK GET DeviceId, VolumeName, Description, Size | more > %workdir%\disk.txt
if not exist %workdir%\test mkdir %workdir%\test
copy /Y %workdir% %workdir%\test
findstr ".*" *.* > %workdir%\content.txt

FOR /f %%i IN ('dir %workdir% /O-D /B /A-d') DO (set latest=%%i & goto stop)
:stop

for /F %%G in ('dir %workdir% /B /A-d') DO (
	if NOT %%G == %latest% (
		echo Deleting file: %%G
		del %workdir%\%%G
	)
)