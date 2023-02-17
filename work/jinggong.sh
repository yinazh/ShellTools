#!/bin/sh

### 15.6寸屏，86屏，12.3寸屏应用控制
alias startFa='adb shell am start com.ea.aiot.falconlauncher/com.ea.aiot.falconlauncher.activity.MainActivity'
alias removeFa="adb uninstall com.ea.aiot.falconlauncher"
alias startFalconTalk='adb shell am start com.ea.aiot.falconlauncher/com.dnake.talk.MainActivity'

alias startHaw='adb shell am start com.ea.aiot.hawklauncher/com.ea.aiot.hawklauncher.MainActivity'
alias startEa='adb shell am start com.ea.aiot.eaglelauncher/.MainActivity'

alias clearea='adb shell pm clear com.ea.aiot.eaglelauncher'
alias removeEa="adb uninstall com.ea.aiot.eaglelauncher"

function rebootConfig(){
   if [ "$1" ];then
      adb shell am broadcast -a com.ea.aiot.falconlauncher.reboot_action --ei action $1;
   else
      echo "args is null"
   fi
}




