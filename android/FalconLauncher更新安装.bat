@ECHO off
@TITLE FalconLauncher��װ
@COLOR E
 
@ECHO ��ʼ����
::��adb.exe��ӵ�PATH�У���aapt.exe��ӵ�path��,Ҳ����ʹ�þ���·��
::@SET PATH=%PATH%;D:\Program Files\adt-bundle-windows-x86-20140702\android-sdk\sdk\platform-tools;D:\Program Files\adt-bundle-windows-x86-20140702\android-sdk\sdk\build-tools\android-4.4W;
@SET PATH=%PATH%;%ANDROID_HOME%\platform-tools;%ANDROID_HOME%\build-tools\android-4.4W;
 
@ECHO **************
@ECHO �ȴ������豸
::�ȴ������豸�����豸ͨ��usb���ӣ����ú�usb����ѡ��
adb wait-for-device

@ECHO **************
::��apkֱ���Ͻ�cmd����ڰ��س���
@SET/p "apk=[�Ϸ��ļ����˲����س�]"
 
::��ȡapk�ļ��еİ���
for /f "delims=" %%a in ('aapt d badging "%apk%"^|findstr "package: "') do (
	::@echo %%a
	for /f "delims=' tokens=2" %%b in ( "%%a" ) do (
		::@echo %%b 
		set packName=%%b
	)
)

@ECHO **************
@echo ж�ؾɿͻ���,����:%packName%
::�Ƚ���apkж�أ�Ȼ���ٰ�װ��apk�����û������ᱨһ����ʾ����Ӱ������İ�װ
adb uninstall %packName%
 
@ECHO **************
@ECHO ���ڰ�װ��%apk%
::��װ�µ�apk
adb install -r %apk%
 
@ECHO **************
@ECHO ��װ���
@PAUSE
@ECHO on