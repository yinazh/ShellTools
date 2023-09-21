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

alias startProgram='start /d/workspace/program'
alias startLog='start /d/workspace/logspace'
alias startSoft='start /d/software'

alias eaToMaster='eaToBranch master'
alias eaToVoice='eaToBranch eaglelauncher_voice'

alias toFalSpace='cd /d/workspace/program/15.6'
alias startFalSpace='start /d/workspace/program/15.6'
alias toFalReleaseSpace='cd /d/workspace/program/15.6/release发版备份--提供给狄耐克'
alias startFalReleaseSpace='start /d/workspace/program/15.6/release发版备份--提供给狄耐克'

alias toHawkSpace='cd /d/workspace/program/8.6'
alias startHawkSpace='start /d/workspace/program/8.6'
alias toHawkReleaseSpace='cd /d/workspace/program/8.6/release'
alias startHawkReleaseSpace='start /d/workspace/program/8.6/release'

alias toEagleSpace='cd /d/workspace/program/12.3'
alias startEagleSpace='start /d/workspace/program/12.3'
alias toEagleReleaseSpace='cd /d/workspace/program/12.3/release'
alias startEagleReleaseSpace='start /d/workspace/program/12.3/release'


alias toMicroSpace='cd /d/workspace/program/10'
alias startMicroSpace='start /d/workspace/program/10'
alias toMicroReleaseSpace='cd /d/workspace/program/10/release'
alias startMicroReleaseSpace='start /d/workspace/program/10/release'

alias toIotSpace='cd /d/workspace/program/iotcontroller'
alias startIotSpace='start /d/workspace/program/iotcontroller'

alias toDevConSpace='cd /d/workspace/program/设备入网需要的配置文件'
alias startDevConSpace='start /d/workspace/program/设备入网需要的配置文件'

##alias start700Dir='start /d/workspace/program/700远程升级工具'
alias start700Tool='start /d/workspace/program/dnake刷机工具及dnake原生资源/700远程升级工具/700升级工具.exe'

alias startPortTool='start /d/software/serialportutilitylatest-v3.8.5/SerialPortUtility/SerialPortUtility.exe'

alias eagleV='adb shell dumpsys package com.ea.aiot.eaglelauncher | findstr version'
alias falV='adb shell dumpsys package com.ea.aiot.falconlauncher | findstr version'
alias hawkV='adb shell dumpsys package com.ea.aiot.hawklauncher | findstr version'
alias microV='adb shell dumpsys package com.ea.aiot.microraptorlauncher | findstr version'

alias clsEa='adb shell pm clear com.ea.aiot.eaglelauncher'
alias clsFal='adb shell pm clear com.ea.aiot.falconlauncher'
alias clsHawk='adb shell pm clear com.ea.aiot.hawklauncher'
