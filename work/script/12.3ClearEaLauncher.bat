@echo off

echo ���EagleLauncher����
adb uninstall com.ea.aiot.eaglelauncher;
timeout 3
echo ���EagleLauncher����
adb shell pm clear com.ea.aiot.eaglelauncher;
pause