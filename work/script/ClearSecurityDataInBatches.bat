@echo off


echo ����ɾ�������ű�

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
			echo ����ɹ�
			set clearResult=1
		) || (
			echo ���ʧ��
			set clearResult=0
		)
	) else (
	    echo �豸����ʧ�ܣ���ִ������
	    set clearResult=0
	)
	
    set targe=%%i   !clearResult!
	if !clearResult!==1 (
		echo ִ�н����[32m!targe![0m
	) else (
		echo ִ�н����[31m!targe![0m
	)
	echo.
    echo !targe! >> results.txt
	if !clearResult!==1 (
	    echo ����ű��ļ�
		adb -s %%i  shell rm -rf sdcard/clear_security_info.sh
	)
	adb disconnect > nul
	echo.
	echo.
)
endlocal

echo **************
echo ִ��������
echo ��������:results.txt
pause


:deviceConnect
echo �����豸 %~1
for /f "delims=*" %%i in ('adb connect %~1') do set connectResult=%%i
::echo ���ӽ����!connectResult!
echo !connectResult! | findstr "connected" > nul && (
::	echo ���ӳɹ� 
	for /f "delims=*" %%j in ('adb -s %~1 root') do set rootResult=%%j
::	echo root�����!rootResult!
	echo !rootResult! | findstr "already" > nul && ( 
::		echo root�ɹ� 
		for /f "delims=*" %%t in ('adb -s %~1 remount') do set remountResult=%%t
::		echo ���ؽ����!remountResult!
		echo !remountResult! | findstr "succeeded" > nul && (
::			echo ���سɹ� 
			set result1=1
		) || ( 
::			echo ����ʧ��
			set result1=0
		)
	) || (
::		echo rootʧ��
		set result1=0
	)
) || (
::	echo ����ʧ��
	set result1=0
)
goto:eof


:clearSecurityInfo
::echo ������...
adb -s %~1 push clear_security_info.sh sdcard/ > nul
adb -s %~1 shell chmod 777 sdcard/clear_security_info.sh
for /f "delims=*" %%t in ('adb -s %~1 shell source sdcard/clear_security_info.sh') do set result2=%%t
::echo ����ű�ִ�н����%result2%
goto:eof