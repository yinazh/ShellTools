@echo off

echo ѭ����ȡIP�ļ�

set targe=''
setlocal enabledelayedexpansion
for /f %%i in (ip.txt) do (
    echo ��ǰ�豸 %%i 
    set targe=%%i 1
    echo !targe! >> results.txt
)


pause