@echo off


echo ÅúÁ¿É¾³ý°²·À½Å±¾

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
			echo Çå³ý³É¹¦
			set clearResult=1
		) || (
			echo Çå³ýÊ§°Ü
			set clearResult=0
		)
	) else (
	    echo Éè±¸Á¬½ÓÊ§°Ü£¬²»Ö´ÐÐÇåÀí£¡
	    set clearResult=0
	)
	
    set targe=%%i   !clearResult!
	if !clearResult!==1 (
		echo Ö´ÐÐ½á¹û£º[32m!targe![0m
	) else (
		echo Ö´ÐÐ½á¹û£º[31m!targe![0m
	)
	echo.
    echo !targe! >> results.txt
	if !clearResult!==1 (
	    echo Çå³ý½Å±¾ÎÄ¼þ
		adb -s %%i  shell rm -rf sdcard/clear_security_info.sh
	)
	adb disconnect > nul
	echo.
	echo.
)
endlocal

echo **************
echo Ö´ÐÐÇå³ýÍê³É
echo Çå³ý±¨¸æ¼û:results.txt
pause


:deviceConnect
echo Á¬½ÓÉè±¸ %~1
for /f "delims=*" %%i in ('adb connect %~1') do set connectResult=%%i
::echo Á¬½Ó½á¹û£º!connectResult!
echo !connectResult! | findstr "connected" > nul && (
::	echo Á¬½Ó³É¹¦ 
	for /f "delims=*" %%j in ('adb -s %~1 root') do set rootResult=%%j
::	echo root½á¹û£º!rootResult!
	echo !rootResult! | findstr "already" > nul && ( 
::		echo root³É¹¦ 
		for /f "delims=*" %%t in ('adb -s %~1 remount') do set remountResult=%%t
::		echo ¹ÒÔØ½á¹û£º!remountResult!
		echo !remountResult! | findstr "succeeded" > nul && (
::			echo ¹ÒÔØ³É¹¦ 
			set result1=1
		) || ( 
::			echo ¹ÒÔØÊ§°Ü
			set result1=0
		)
	) || (
::		echo rootÊ§°Ü
		set result1=0
	)
) || (
::	echo Á¬½ÓÊ§°Ü
	set result1=0
)
goto:eof


:clearSecurityInfo
::echo ÇåÀíÖÐ...
adb -s %~1 push clear_security_info.sh sdcard/ > nul
adb -s %~1 shell chmod 777 sdcard/clear_security_info.sh
for /f "delims=*" %%t in ('adb -s %~1 shell source sdcard/clear_security_info.sh') do set result2=%%t
::echo ÇåÀí½Å±¾Ö´ÐÐ½á¹û£º%result2%
goto:eof