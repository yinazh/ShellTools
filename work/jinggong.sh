#!/bin/sh

### 15.6寸屏，86屏，12.3寸屏应用控制
alias startFalconLaunchr='adb shell am start com.ea.aiot.falconlauncher/com.ea.aiot.falconlauncher.activity.MainActivity'
alias removeFalconLauncher="adb uninstall com.ea.aiot.falconlauncher"

alias start86Launchr='adb shell am start com.ea.aiot.hawklauncher/com.ea.aiot.hawklauncher.MainActivity'

alias connect86='adb connect 192.168.80.143'
alias connect12='adb connect 192.168.80.163'
alias connect106='adb connect 192.168.80.106'

