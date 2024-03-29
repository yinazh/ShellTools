@echo off


echo 批量删除安防脚本

cd.>results.txt
echo.
set targe=''
set clearResult=''
setlocal enabledelayedexpansion
for /f %%i in (ip.txt) do (
	echo **************
    call:deviceConnect %%i result1
	if !result1!==1 (
		call:clearSecurityInfo %%i result2
		echo !result2! | findstr "1" > nul && (
			echo 清除成功
			set clearResult=1
		) || (
			echo 清除失败
			set clearResult=0
		)
	) else (
	    echo 设备连接失败，不执行清理！
	    set clearResult=0
	)
	
    set targe=%%i   !clearResult!
	if !clearResult!==1 (
		echo 执行结果：[32m!targe![0m
	) else (
		echo 执行结果：[31m!targe![0m
	)
	echo.
    echo !targe! >> results.txt
	if !clearResult!==1 (
	    echo 清除脚本文件
		adb -s %%i  shell rm -rf sdcard/clear_security_info.sh
	)
	adb disconnect > nul
	echo.
	echo.
)
endlocal

echo **************
echo 执行清除完成
echo 清除报告见:results.txt
pause


:deviceConnect
echo 连接设备 %~1
for /f "delims=*" %%i in ('adb connect %~1') do set connectResult=%%i
::echo 连接结果：!connectResult!
echo !connectResult! | findstr "connected" > nul && (
::	echo 连接成功 
	for /f "delims=*" %%j in ('adb -s %~1 root') do set rootResult=%%j
::	echo root结果：!rootResult!
	echo !rootResult! | findstr "already" > nul && ( 
::		echo root成功 
		for /f "delims=*" %%t in ('adb -s %~1 remount') do set remountResult=%%t
::		echo 挂载结果：!remountResult!
		echo !remountResult! | findstr "succeeded" > nul && (
::			echo 挂载成功 
			set result1=1
		) || ( 
::			echo 挂载失败
			set result1=0
		)
	) || (
::		echo root失败
		set result1=0
	)
) || (
::	echo 连接失败
	set result1=0
)
goto:eof


:clearSecurityInfo
::echo 清理中...
adb -s %~1 push clear_security_info.sh sdcard/ > nul
adb -s %~1 shell chmod 777 sdcard/clear_security_info.sh
for /f "delims=*" %%t in ('adb -s %~1 shell source sdcard/clear_security_info.sh') do set result2=%%t
::echo 清理脚本执行结果：%result2%
goto:eof