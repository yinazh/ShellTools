#!/bin/sh


## for Windows 工作目录
alias toWorkplace='cd /d/workplace'
alias toProgram='cd /d/program'
alias toShare='cd /d/workplace/shareWindow'
alias toMedia='cd /d/workplace/source'
alias toUICheck='cd /d/tools/uiCheck'
alias toSign='cd /d/tools/signapk/sda670-new'
alias toTools='cd /d/workplace/ShellWork'


#XgRobotics: sign apk
function xgSign(){
  LOCAL_PATH=$(pwd)
  UNSIGN_FILENAME=$1
  NEW_SIGN_TOOLS_PATH=/d/tools/signapk/sda670-new
  OLD_SIGN_TOOLS_PATH=/d/tools/signapk/sda670-old
  AOSP_SIGN_PLATFORM_TOOLS_PATH=/d/tools/signapk_aosp_platform
  local SIGN_TOOLS_PATH
  if [ -z "$1" ] ;then
      echo "unsign application is null..."
	  return
  else
    if [ "$2" == "old" ] ;then
        echo "old sign ..."
        SIGN_TOOLS_PATH=${OLD_SIGN_TOOLS_PATH}
    elif [ "$2" == "aosp" ] ;then
        echo "aosp platform sign ..."
        SIGN_TOOLS_PATH=${AOSP_SIGN_PLATFORM_TOOLS_PATH}
    else
        echo "sign ..."
        SIGN_TOOLS_PATH=${NEW_SIGN_TOOLS_PATH}
    fi
    java -jar ${SIGN_TOOLS_PATH}/signapk.jar -w ${SIGN_TOOLS_PATH}/platform.x509.pem ${SIGN_TOOLS_PATH}/platform.pk8 ${UNSIGN_FILENAME} "app_sign.apk"
    mv ${LOCAL_PATH}/app_sign.apk ${UNSIGN_FILENAME}
    echo "sign completed"
  fi
}

function xgSignInstal(){
    LOCAL_PATH=$(pwd)
	if [ -z "$1" ] ;then
      echo "unsign application is null..."
	  return
	fi
	FILENAME=$1
	xgSign ${FILENAME}
	adb install -r ${UNSIGN_FILENAME}
}

## for connect device begin
#XgRobotics: connect puppy cube
function connectC1(){
  #CONNECT_IP="10.58.6.248"
  CONNECT_IP="10.58.11.221"
  adb connect ${CONNECT_IP};
  sleep 1;
  adb root;
  sleep 1;
  adb connect ${CONNECT_IP};
  sleep 1;
  adb remount;
}

function connectM1(){
  rootinfo=`adb root`
  if [ "$rootinfo" != "adbd is already running as root" ];then
	  sleep 1;
      adb root;
  fi
  
  remount=`adb remount`
  if [ "$remount" != "remount succeeded" ];then
	  sleep 1;
      adb remount;
  fi
  echo "connect device success!"
}

function connectIP(){
  if [ "$1" ];then
     echo "connect $1"
     adb connect $1
  else
     echo "clear no application"
  fi
}
## for connect device end

## for restart C1 AI
function restartAI(){
   adb shell am force-stop com.puppy.ai;
   adb shell am startservice com.puppy.ai/.AiService;
}

function installThirdLauncher(){
   adb shell setprop support.third.launcher true;
}

function flashM1Guide(){
   echo flash start
   adb shell setprop persist.sys.mainguide 0;
   adb shell setprop persist.sys.appguide 0;
   adb shell pm clear com.puppy.launcher;
   echo flash success
}

function flashSystemUI(){
   connectM1;
   sleep 1;
   apush SystemUI.apk system/priv-app/SystemUI/;
   sleep 1;
   arebot;
}

function flashSystemUIWithRecentsRebot(){
    connectM1;
	sleep 1;
	apush SystemUIWithLegacyRecents.apk system/product/priv-app/SystemUIWithLegacyRecents/;
	apush oat/arm64/SystemUIWithLegacyRecents.odex system/product/priv-app/SystemUIWithLegacyRecents/oat/arm64/;
	apush oat/arm64/SystemUIWithLegacyRecents.vdex system/product/priv-app/SystemUIWithLegacyRecents/oat/arm64/;
	apush SystemUIWithLegacyRecents.apk system/product/priv-app/SystemUIWithLegacyRecents/;
	acls com.android.systemui;
	sleep 1;
	arebot;
}

function flashSystemUIWithRecents(){
    connectM1;
	sleep 1;
	apush SystemUIWithLegacyRecents.apk system/product/priv-app/SystemUIWithLegacyRecents/;
	apush oat/arm64/SystemUIWithLegacyRecents.odex system/product/priv-app/SystemUIWithLegacyRecents/oat/arm64/;
	apush oat/arm64/SystemUIWithLegacyRecents.vdex system/product/priv-app/SystemUIWithLegacyRecents/oat/arm64/;
	acls com.android.systemui;
}

function flashK1Settigs(){
    connectM1;
	sleep 1;
	apush Settings.apk system/product/priv-app/Settings/;
	acls com.android.settings;
	arebot;
}

function flashPuppySettigs(){
    connectM1;
	sleep 1;
	apush PuppySettings.apk system/priv-app/PuppySettings/;
	#apush oat/arm64/PuppySettings.odex system/priv-app/PuppySettings/oat/arm64/;
	#apush oat/arm64/PuppySettings.vdex system/priv-app/PuppySettings/oat/arm64/;
	acls com.puppy.settings;
}

function setBetaWorkforCameraSDK(){
    connectM1;
	aWriteProp persist.sys.auth.api false;
	aWriteProp persist.sys.auth.device.test true;
	echo "CameraSDK Beta Environment Success!"
}

function openKidsDebug(){
    connectM1;
	result=`aReadProp persist.sys.debug.kids`
	echo "read Kids Debug ：$result"
	if [ "$result" != "true" ];then
		echo "set Kids Debug true"
		aWriteProp persist.sys.debug.kids true;
		echo "success!"
	fi
}

function resetKidsGuide(){
    connectM1;
	aWriteProp persist.sys.kidsguide false;
}

function setCameraSdkUseTime(){
   if [ "$1" ];then
      adb shell am broadcast -a com.puppy.camera.sdk.test --ei authed_time $1;
   else
      echo "time is null"
   fi
}

function puppyTouch(){
	if [ "$1" == "stop" ] ;then
        adb shell am stopservice com.puppy.touchcontrol/.TouchService
    elif [ "$1" == "start" ] ;then
        adb shell am startservice com.puppy.touchcontrol/.TouchService
    else
        echo "TouchService command is error, please check"
    fi
}
