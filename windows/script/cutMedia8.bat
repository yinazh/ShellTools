@echo off

:: 去掉音频前八分钟

setlocal enabledelayedexpansion
for %%j in (D:\BaiduNetdiskDownload\test\*.mp3) do (
		set filename=%%~nj
		set filename=!filename:.=_!
		set filename=!filename: =!
		if not "!filename!"=="%%~nj" ren "%%j" "!filename!%%~xj"
)

for %%s in (D:\BaiduNetdiskDownload\test\*.mp3) do (
        ffmpeg -i %%s -ss 00:00:8 -acodec copy %%s_dest.mp3
        del /s /q /f %%s
)

pause