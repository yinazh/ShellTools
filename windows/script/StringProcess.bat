@echo off & setlocal

rem strlen=31
set str=This is a string function demo.

rem 倒数第5位开始，取4位：demo
echo %str:~-5,4%

rem 倒数第5位开始，取剩余所有字符：demo.
echo %str:~-5%

rem 倒数第100位开始，返回从0位开始的字符串：This is a string function demo.
echo %str:~-100%

rem 倒数第0位开始，取4位：This
echo %str:~0,4%

rem 倒数第0位开始，取所有字符：This is a string function demo.
echo %str:~0%

rem 倒数第0位开始，取100位超出长度，返回：This is a string function demo.
echo %str:~0,100%

rem 截取字符串赋值给变量
set str1=%str:~0,4%
echo str1=%str1%

rem 显示系统时间，去掉后面的毫秒显示
echo %time:~0,8%

pause