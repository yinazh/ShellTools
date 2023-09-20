@echo off

echo 清除EagleLauncher更新
adb uninstall com.ea.aiot.eaglelauncher;
timeout 3
echo 清除EagleLauncher缓存
adb shell pm clear com.ea.aiot.eaglelauncher;
pause