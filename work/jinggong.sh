#!/bin/sh

### 15.6寸屏，86屏，12.3寸屏应用控制
alias startFalconLaunchr='adb shell am start com.ea.aiot.falconlauncher/com.ea.aiot.falconlauncher.activity.MainActivity'
alias removeFalconLauncher="adb uninstall com.ea.aiot.falconlauncher"
alias startFalconTalk='adb shell am start com.ea.aiot.falconlauncher/com.dnake.talk.MainActivity'

alias start86Launchr='adb shell am start com.ea.aiot.hawklauncher/com.ea.aiot.hawklauncher.MainActivity'
alias startEagleLauncher='adb shell am start com.ea.aiot.eaglelauncher/.MainActivity'

function connect80(){
  if [ "$1" ];then
     echo "connect $1"
     adb connect 192.168.80.$1
  else
     echo "IP address is null"
  fi
}

function connect70(){
  if [ "$1" ];then
     echo "connect $1"
     adb connect 192.168.70.$1
  else
     echo "IP address is null"
  fi
}




