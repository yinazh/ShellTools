@echo off

for /f "delims=*" %%t in ('adb shell source sdcard/clear_security_info.sh') do set str=%%t
set targe=ִ�н����%str%
echo %targe%

pause