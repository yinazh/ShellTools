#!/bin/sh

### 15.6寸屏，86屏，12.3寸屏应用控制

#### 
alias setServerIp='adb shell setprop persist.sys.serverip'
function setEnv(){
   if [ "$1" ];then
      adb shell setprop persist.sys.env $1;
   else
      echo "args is null"
   fi
}

#### 15.6寸屏
alias startFa='adb shell am start com.ea.aiot.falconlauncher/com.ea.aiot.falconlauncher.activity.MainActivity'
alias removeFa="adb uninstall com.ea.aiot.falconlauncher"
alias clearFa='adb shell pm clear com.ea.aiot.falconlauncher'
alias startFalconTalk='adb shell am start com.ea.aiot.falconlauncher/com.dnake.talk.MainActivity'
function rebootConfig(){
   if [ "$1" ];then
      adb shell am broadcast -a com.ea.aiot.falconlauncher.reboot_action --ei action $1;
   else
      echo "args is null"
   fi
}

#### 86屏
alias startHa='adb shell am start com.ea.aiot.hawklauncher/com.ea.aiot.hawklauncher.MainActivity'


#### 12.3寸屏开关
alias startEa='adb shell am start com.ea.aiot.eaglelauncher/.MainActivity'
alias clearEa='adb shell pm clear com.ea.aiot.eaglelauncher'
alias removeEa="adb uninstall com.ea.aiot.eaglelauncher"
function setEaBranch(){
   if [ "$1" ];then
      adb shell setprop persist.sys.eaglebranch $1;
   else
      echo "args is null"
   fi
}
alias setEaDebug='adb shell setprop persist.eadebug'

function eaToBranch(){
   if [ "$1" ];then
      setEaBranch $1;
	  clearEa;
	  startEa;
   else
      echo "args is null"
   fi
}

alias eaToMaster='eaToBranch master'
alias eaToVoice='eaToBranch eaglelauncher_voice'








