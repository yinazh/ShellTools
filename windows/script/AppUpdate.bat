@ECHO off
@TITLE FalconLauncher安装
@COLOR E
 
@ECHO 初始化…
::将adb.exe添加到PATH中，将aapt.exe添加到path中,也可以使用绝对路径
::@SET PATH=%PATH%;D:\Program Files\adt-bundle-windows-x86-20140702\android-sdk\sdk\platform-tools;D:\Program Files\adt-bundle-windows-x86-20140702\android-sdk\sdk\build-tools\android-4.4W;
@SET PATH=%PATH%;%ANDROID_HOME%\platform-tools;%ANDROID_HOME%\build-tools\android-4.4W;
 
@ECHO **************
@ECHO 等待连接设备
::等待连接设备，将设备通过usb连接，设置好usb调试选项
adb wait-for-device

@ECHO **************
::将apk直接拖进cmd命令窗口按回车键
@SET/p "apk=[拖放文件到此并按回车]"
 
::获取apk文件中的包名
for /f "delims=" %%a in ('aapt d badging "%apk%"^|findstr "package: "') do (
	::@echo %%a
	for /f "delims=' tokens=2" %%b in ( "%%a" ) do (
		::@echo %%b 
		set packName=%%b
	)
)

@ECHO **************
@echo 卸载旧客户端,包名:%packName%
::先将旧apk卸载，然后再安装新apk，如果没有这个会报一个提示，不影响下面的安装
adb uninstall %packName%
 
@ECHO **************
@ECHO 正在安装：%apk%
::安装新的apk
adb install -r %apk%
 
@ECHO **************
@ECHO 安装完成
@PAUSE
@ECHO on