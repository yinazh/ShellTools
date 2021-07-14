@echo off

setlocal enabledelayedexpansion
for %%f in (D:\BaiduNetdiskDownload\test1\*.mp3) do (
	echo %%f
	set name=%%f
	ren !name! !name:~0,-10%!
)
pause