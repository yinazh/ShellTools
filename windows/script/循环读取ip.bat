@echo off

echo 循环读取IP文件

set targe=''
setlocal enabledelayedexpansion
for /f %%i in (ip.txt) do (
    echo 当前设备 %%i 
    set targe=%%i 1
    echo !targe! >> results.txt
)


pause