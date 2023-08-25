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
alias startSoft='star /d/software'

alias eaToMaster='eaToBranch master'
alias eaToVoice='eaToBranch eaglelauncher_voice'

alias to156Space='cd /d/workspace/program/15.6'
alias start156Space='start /d/workspace/program/15.6'
alias to156ReleaseSpace='cd /d/workspace/program/15.6/release发版备份--提供给狄耐克'
alias start156ReleaseSpace='start /d/workspace/program/15.6/release发版备份--提供给狄耐克'

alias to86Space='cd /d/workspace/program/8.6'
alias start86Space='start /d/workspace/program/8.6'
alias to86ReleaseSpace='cd /d/workspace/program/8.6/release'
alias start86ReleaseSpace='start /d/workspace/program/8.6/release'

alias to123Space='cd /d/workspace/program/12.3'
alias start123Space='start /d/workspace/program/12.3'
alias to123ReleaseSpace='cd /d/workspace/program/12.3/release'
alias start123ReleaseSpace='start /d/workspace/program/12.3/release'


alias to10Space='cd /d/workspace/program/10'
alias start10Space='start /d/workspace/program/10'
alias to10ReleaseSpace='cd /d/workspace/program/10/release'
alias start10ReleaseSpace='start /d/workspace/program/10/release'

alias toIotSpace='cd /d/workspace/program/iotcontroller库'
alias startIotSpace='start /d/workspace/program/iotcontroller库'

alias toDevConSpace='cd /d/workspace/program/设备入网需要的配置文件'
alias startDevConSpace='start /d/workspace/program/设备入网需要的配置文件'




