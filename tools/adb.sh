#!/bin/sh

## for adb tools

export SHELL_DIR="${CMDER_ROOT}/../../code/ShellTools"

### adb服务指令
alias aStartSev='adb start-server'
alias aKillSev='adb kill-server'

### 操作指令
alias ashl='adb shell'
alias arot='adb root'
alias arbot='adb reboot'
alias amont='adb remount'
alias adev='adb devices'
alias acon='adb connect'
function condev(){
  rootinfo=`adb root`
  alreadyRoot="adbd is already running as root"
  noPermission="Permission denied"
 
  if [ "$rootinfo" != "${alreadyRoot}" ];then
      adb root;
	  wait
  fi
  
  while (true)
  do
	  remount=`adb remount`
	  wait
	  
	  if [ "$remount" != "remount succeeded" ];then
	  	result=$(echo $remount | grep "${noPermission}")
	    if [[ "$result" != "" ]];then
		   adb disable-verity;
		   wait
		   adb reboot;
		fi
	      
	    echo $remount
	  else 
		  echo "connect device success!"
		  break;
	  fi
  done
}

function conip(){
  if [ "$1" ];then
     echo "connect $1"
     adb connect $1
  else
     echo "IP address is null"
  fi
}

function consip(){
  if [ "$1" ];then
     LOCAL_IP=`python ${SHELL_DIR}/env/ip.py`
     REMOTE_IP="${LOCAL_IP%.*}.$1"
     echo "connect $REMOTE_IP"
     adb connect $REMOTE_IP
  else
     echo "IP address is null"
  fi
}
## for connect device end



alias adisconn='adb disconnect'

alias ainstal='adb install '
alias ainstar='adb install -r'
alias ainstat='adb install -t'
alias ainstas='adb install -s'
alias ainstad='adb install -d'
alias ainstag='adb install -g'
alias ainstat='adb install -t'
alias auinstal='adb uninstall'
## -k 保留应用配置和缓存文件
alias auinstak='adb uninstall -k'

alias aShutDown='adb shell reboot -p'

## -W 显示应用启动耗时
alias astartW="adb shell am start -W "

### 模拟操作
alias apul='adb pull'
alias apush='adb push'
alias astart='adb shell am start'
alias abroad='adb shell am broadcast -a'
alias acls='adb shell pm clear'
alias aStop='adb shell am force-stop' #强制停止应用

function keyDown() {
	if [ "$1" ];then
		adb shell input keyevent $1;
	else
		echo "KeyDown value is null"
	fi
}

function whileKeyDown(){
  if [ "$1" ];then
    while (true)
    do
       adb shell input keyevent $1;
       sleep 0.01;
    done
  else
     echo "KeyDown value is null"
  fi
}

alias keyBack='adb shell input keyevent 4'
alias keyHome='adb shell input keyevent 3'
alias keyVol+='adb shell input keyevent 24'
alias keyVol-='adb shell input keyevent 25'
alias keyPower='adb shell input keyevent 26'
alias keyMute='adb shell input keyevent 164'
alias keyScreenCap='adb shell input keyevent 120'
alias keyScreenOn='adb shell input keyevent 224'
alias keyScreenOff='adb shell input keyevent 223'
alias keyBright+="adb shell input keyevent 221"
alias keyBright-="adb shell input keyevent 220"
alias keyInput='adb shell input text'


alias broadcastBootCompleted="adb shell am broadcast -a android.intent.action.BOOT_COMPLETED"
alias broadcastBootCompletedPkg="adb shell am broadcast -a android.intent.action.BOOT_COMPLETED -n "
alias broadcastScreenOn="adb shell am broadcast -a android.intent.action.SCREEN_ON"
alias broadcastScreenOnPkg="adb shell am broadcast -a android.intent.action.SCREEN_ON -n "
alias broadcastScreenOff="adb shell am broadcast -a android.intent.action.SCREEN_OFF"
alias broadcastScreenOffPkg="adb shell am broadcast -a android.intent.action.SCREEN_OFF -n "

function broadcastAction(){
   if [ "$1" ];then
      adb shell am broadcast -a $1;
   else
      echo "action is null, please enter : broadcastAction action"
   fi
}

function whileBroadcastAction(){
  if [ "$1" ];then
    while (true)
    do
       adb shell am broadcast -a $1;
       sleep 2;
    done
  else
     echo "action is null, please enter : whileBroadcastAction action"
  fi
}

function clearApp(){
   if [ "$1" ];then
      echo "clearing..."
      adb shell pm clear $1
   else
      echo "clear no application"
   fi
}

### 调试操作
alias alogt='adb logcat -v time'
alias alogc='adb logcat -c'
alias alruntime='adb logcat -s AndroidRuntime'
alias alogw="adb logcat "\*:W""
alias aloge="adb logcat "\*:E""
alias abug='adb bugreport'
alias pidcat='python ${SHELL_DIR}/tools/pidcat.py'

function alogcat(){
  DATE=`date "+%Y%m%d_%H%M%S"`
  #echo ${DATE}
  LOCAL_PATH=$(pwd)
  #echo $LOCAL_PATH
  adb logcat -c ;
  echo "start catch log"
  echo "**************************************"
  if [ -z "$1" ] ;then
    FILENAME="log_${DATE}.log"
    echo $FILENAME
    adb logcat -v time > ${LOCAL_PATH}/$FILENAME
  else
    if [ "radio" == $1 ] ;then
      echo "radio logs:"
      FILENAME="log_radio_${DATE}.log"
      echo $FILENAME
      adb logcat -b radio -v time > ${LOCAL_PATH}/$FILENAME
    elif [ "$1" == "main" ] ;then
      echo "main logs:"
      FILENAME="log_main_${DATE}.log"
      echo $FILENAME
      adb logcat -b main -v time > ${LOCAL_PATH}/$FILENAME
    elif [ "$1" == "events" ] ;then
      echo "events logs:"
      FILENAME="log_events_${DATE}.log"
      echo $FILENAME
      adb logcat -b events -v time > ${LOCAL_PATH}/$FILENAME
    else
      echo "grep $1 logs"
      FILENAME="log_${DATE}.log"
      echo $FILENAME
      adb logcat -v time | grep $1 > ${LOCAL_PATH}/$FILENAME
    fi
  fi
  echo "**************************************"
  echo "end catch log"
}

alias aTop='adb shell top'
alias aTop10='adb shell top -s 10' #查看占用内存前10 的app
alias adumps='adb shell dumpsys activity'
alias adumAcy='adb shell dumpsys activity activities | grep mFocusedActivity'
alias aMeminfo='adb shell dumpsys meminfo' #内存使用情况Memory Usage
alias aSevList='adb shell service list'


function adumpHeap(){
    if [ "$1" ];then
	    echo "dump pkg heap ..."
	    adb shell am dumpheap $1 data/local/tmp/$1.hprof
	    adb pull data/local/tmp/$1.hprof ${LOCAL_PATH}
    else
	    echo "application pkgName is null, please check"
    fi

}

function adumpsPkg(){
	if [ "$1" ];then
       echo "finding ..."
       adb shell dumpsys package $1
    else
       echo "application packageName is null, please check"
    fi
}

function adumpPkgFile(){
	LOCAL_PATH=$(pwd)
	echo $LOCAL_PATH
	if [ "$1" ] ;then
		FILENAME="Info_$1.log"
		echo $FILENAME
		adb shell dumpsys package $1 > ${LOCAL_PATH}/$FILENAME
		echo "package store $FILENAME success !"
	fi
}

alias systrace='python /d/software/platform-tools_33/systrace/systrace.py'


### 模式权限相关
alias aSideLoad='adb sideload'
alias aBootloader='adb reboot bootloader'
alias aRecovery='adb reboot recovery'
alias aEdl='adb reboot edl'
alias aDisVerity='adb disable-verity'


### 读取系统配置
alias aReadProp='adb shell getprop '
alias aWriteProp='adb shell setprop '
alias aBattery='adb shell dumpsys battery'
alias aCpuInfo='adb shell cat /proc/cpuinfo'
alias aCpuInfoM='adb shell dumpsys cpuinfo'
alias aMemoryInfo='adb shell dumpsys meminfo'
alias aModel='adb shell getprop ro.product.model'  #设备型号
alias aMAC='adb shell cat sys/class/net/wlan0/address'  #读取mac地址
alias aWmSize='adb shell wm size' #查看屏幕分辨率
alias aWmSizeReset='adb shell wm size reset'
alias aDensity='adb shell wm density' #查看屏幕密度
alias aDensityReset='adb shell wm density reest'
alias aDeviceId='adb get-serialno'
alias aIpWlan='adb shell ifconfig wlan0'
alias aIpEth='adb shell ifconfig eth0'
##获取屏幕显示信息
alias aWindow='adb shell dumpsys window displays'
alias aAndroidVersion='adb shell getprop ro.build.version.release'
alias aSdk='adb shell getprop ro.build.version.sdk'
alias aBuildProp='adb shell cat system/build.prop'
alias aCpuSupl='adb shell getprop ro.product.cpu.abilist'
alias aDvkHeapSize='adb shell getprop dalvik.vm.heapsize'


##查看SurfaceFlinger
alias aSufaceFlinger='adb shell dumpsys SurfaceFlinger'
##测试性能，后面加包名
alias agfxinfo='adb shell dumpsys gfxinfo ' 

alias aSystem='adb shell settings list system'
alias aGlobal='adb shell settings list global'
alias aSecure='adb shell settings list secure'
alias aGetSystem='adb shell settings get system'
alias aGetGlobal='adb shell settings get global'
alias aGetSecure='adb shell settings get secure'
alias aPutSystem='adb shell settings put system'
alias aPutGlobal='adb shell settings put global'
alias aPutSecure='adb shell settings put secure'


#####获取系统版本号
function afindPkgVsion(){
	if [ "$1" ];then
       echo "finding ..."
       adb shell dumpsys package $1 | findstr version
    else
       echo "application packageName is null, please check"
    fi
}


### 读取系统内容
alias aListPkgs='adb shell pm list packages'
alias aListSysPkgs='adb shell pm list packages -s' #列出系统应用的所有包名
alias aList3Pkgs='adb shell pm list packages -3'  #列出除了系统应用的第三方应用包名
alias aListPkg='adb shell am monitor' #持续监控app的报名
alias aListPkgFrom='adb shell pm list packages -i' #显示包的安装来源
alias aListPkgAs='adb shell pm list pakcages -f' #显示包及关联的文件

### 焦点
alias aFindFocus='adb shell dumpsys window | findstr mCurrentFocus'

### 录屏/截屏
alias aScreenRecord='adb shell screenrecord /sdcard/filename.mp4'
function screenCap(){
   adb shell system/bin/screencap -p sdcard/cap.png;
   adb pull sdcard/cap.png D:/;
   adb shell rm sdcard/cap.png;
}

### Monkey测试指令
alias aMonkey='adb shell monkey'

function aMonkeyPkg100(){
	if [ "$1" ];then
       adb shell monkey -p $1 100
    else
       echo "application packageName is null, please check"
    fi
}

### 获取屏幕控件
#from：https://www.cnblogs.com/heyuling/p/13032123.html
alias aUIDump='adb shell uiautomator dump sdcard/screen.uix'
alias aScreenCap='adb shell screencap -p sdcard/screen.png'
alias startUiAutomatorViewer='start /c/Users/Administrator/AppData/Local/Android/Sdk/tools/bin/uiautomatorviewer.bat'
alias startScreen='java -jar /d/software/androidscreencast-0.0.12s-executable.jar'

function startUiAutomator(){
    LOCAL_PATH=$(pwd)
	echo ${LOCAL_PATH}
	aUIDump;
	apul sdcard/screen.uix ${LOCAL_PATH}/
	aScreenCap;
	apul sdcard/screen.png ${LOCAL_PATH}/
	startUiAutomatorViewer;
}

function screenCapFile(){
    LOCAL_PATH=$(pwd)
	echo ${LOCAL_PATH}
	aScreenCap;
	apul sdcard/screen.png ${LOCAL_PATH}/
}

### 打开原生应用
alias startSettings='adb shell am start com.android.settings'

alias closeAdb='adb shell settings put global adb_enabled 0'
alias openWifi='adb shell svc wifi enable'
alias closeWifi='adb shell svc wifi disable'


