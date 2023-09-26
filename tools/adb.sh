#!/bin/sh

## for adb tools

export SHELL_DIR="${CMDER_ROOT}/../../code/ShellTools"

### adb指令说明文档
function adb_tools_help(){
	ip_help
	adb_help
	keydown_help
	broad_help
	logcat_help
	app_runtime_help
	android_help
	system_help
	debug_help
}

function adb_help(){
	echo "asser(启动adb)  akser(关闭adb)  ashl(shell)  arot(root)  arbot(reboot)  amont(remount)  adev(devices)  acon(connect)  condev(root+remount)"
	echo "adiscon(disconnect)  ainstal(install)  ainstar(install -r)  ainstat(install -t安装testOnly=true的应用)  ainstas(install -s安装到dcard)"  
	echo "ainstag(install -g授予所有运行时权限)  ainstad(install -d允许降级覆盖安装)  auinstak(uninstall -k保留数据和缓存)"
	echo "apul(pull)  apush(push)  astart(am start)  abroad(am broadcast -a)  acls(pm clear)  astop(am force-stop)"
	echo "ashutDown  astartW(显示应用启动耗时)"
}

### adb服务指令
alias asser='adb start-server'
alias akser='adb kill-server'

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

function ip_help(){
	echo "conip(connect ip)  consip(连接同网段内ip)"
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



alias adiscon='adb disconnect'

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

alias ashutDown='adb shell reboot -p'

## -W 显示应用启动耗时
alias astartW="adb shell am start -W "

### 模拟操作
alias apl='adb pull'
alias aph='adb push'
alias astart='adb shell am start'
alias abroad='adb shell am broadcast -a'
alias acls='adb shell pm clear'
alias astop='adb shell am force-stop' #强制停止应用

function keydown_help(){
	echo "keyDown(keyevent)  whileKeyDown(loop keyevent)  keyBack  keyHome  keyScreenCap  keyScreenOn  keyScreenOff"
	echo "keyVol+  keyVol-  keyBright+  keyBright-  keyInput  keyMute  keyPower"
}

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


function broad_help(){
	echo "bBootCompleted  bBootCompletedPkg  bScreenOn  bScreenOnPkg  bScreenOff  bScrenOffPkg"
	echo "bAction  whileBAction"
}

alias bBootCompleted="adb shell am broadcast -a android.intent.action.BOOT_COMPLETED"
alias bBootCompletedPkg="adb shell am broadcast -a android.intent.action.BOOT_COMPLETED -n "
alias bScreenOn="adb shell am broadcast -a android.intent.action.SCREEN_ON"
alias bScreenOnPkg="adb shell am broadcast -a android.intent.action.SCREEN_ON -n "
alias bScreenOff="adb shell am broadcast -a android.intent.action.SCREEN_OFF"
alias bScreenOffPkg="adb shell am broadcast -a android.intent.action.SCREEN_OFF -n "

function bAction(){
   if [ "$1" ];then
      adb shell am broadcast -a $1;
   else
      echo "action is null, please enter : broadcastAction action"
   fi
}

function whileBAction(){
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
function logcat_help(){
	echo "alogt(-v time)  alogc(-c)  alruntime(AndroidRuntime)  alogw(*W)  aloge(*E)  abug(bugreport)  pidcat"
	echo "alogcat(radio, main, events, null > file)  systrace"
}


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


function app_runtime_help(){
	echo "atop  atop10  adumps  adumAcy(当前应用)  ameminfo(内存使用情况)  aserlist(服务列表)"
	echo "adumpHeap(堆栈信息>file)  adumpsPkg(堆栈运行信息)  adumpPkgFile(堆栈运行信息>file)"
	echo "afPkgVsion(应用版本pkg)  alpkgs(列出所有应用)  alSysPkgs(列举系统应用)  alPkgFrom(显示安装来源)  alPkgAs(显示包及关联文件)"
}
alias atop='adb shell top'
alias atop10='adb shell top -s 10' #查看占用内存前10 的app
alias adumps='adb shell dumpsys activity'
alias adumAcy='adb shell dumpsys activity activities | grep mFocusedActivity'
alias ameminfo='adb shell dumpsys meminfo' #内存使用情况Memory Usage
alias aserlist='adb shell service list'


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



function android_help(){
	echo "aSideLoad  aBootloader  aRecovery  aEdl  aDisverity"
}
### 模式权限相关
alias aSideLoad='adb sideload'
alias aBootloader='adb reboot bootloader'
alias aRecovery='adb reboot recovery'
alias aEdl='adb reboot edl'
alias aDisverity='adb disable-verity'


function android_system_help(){
	echo "arprop(getprop)  awprop(setprop)	abattery  acpuInof  acpuInfoM  amemInfo  amodel  amac"
	echo "awmSize  awmSizeReset  adensity  adensityReset  adeviceId  aipWlan  aipEth  awindow"
	echo "aAndroidVersion  asdk  abuildProp acpuSupl  advkHeapSize  aSufaceFlinger  agfxinfo(测试性能pkg)"
	echo "aSystem(system属性列表)  aGlobal(global属性列表)  aSecure(secure属性列表)"
	echo "arSystem   arGlobal  arSecure  awSystem  awGlobal  awSecure"
	echo "startSettings  closeAdb  openWifi  closeWifi"
}


### 读取系统配置
alias arprop='adb shell getprop '
alias awprop='adb shell setprop '
alias abattery='adb shell dumpsys battery'
alias acpuInfo='adb shell cat /proc/cpuinfo'
alias acpuInfoM='adb shell dumpsys cpuinfo'
alias amemInfo='adb shell dumpsys meminfo'
alias amodel='adb shell getprop ro.product.model'  #设备型号
alias amac='adb shell cat sys/class/net/wlan0/address'  #读取mac地址
alias awmSize='adb shell wm size' #查看屏幕分辨率
alias awmSizeReset='adb shell wm size reset'
alias adensity='adb shell wm density' #查看屏幕密度
alias adensityReset='adb shell wm density reest'
alias adeviceId='adb get-serialno'
alias aipWlan='adb shell ifconfig wlan0'
alias aipEth='adb shell ifconfig eth0'
##获取屏幕显示信息
alias awindow='adb shell dumpsys window displays'
alias aAndroidVersion='adb shell getprop ro.build.version.release'
alias asdk='adb shell getprop ro.build.version.sdk'
alias abuildProp='adb shell cat system/build.prop'
alias acpuSupl='adb shell getprop ro.product.cpu.abilist'
alias advkHeapSize='adb shell getprop dalvik.vm.heapsize'


##查看SurfaceFlinger
alias aSufaceFlinger='adb shell dumpsys SurfaceFlinger'
##测试性能，后面加包名
alias agfxinfo='adb shell dumpsys gfxinfo ' 

alias aSystem='adb shell settings list system'
alias aGlobal='adb shell settings list global'
alias aSecure='adb shell settings list secure'
alias arSystem='adb shell settings get system'
alias arGlobal='adb shell settings get global'
alias arSecure='adb shell settings get secure'
alias awSystem='adb shell settings put system'
alias awGlobal='adb shell settings put global'
alias awSecure='adb shell settings put secure'


#####获取系统版本号
function afPkgVsion(){
	if [ "$1" ];then
       echo "finding ..."
       adb shell dumpsys package $1 | findstr version
    else
       echo "application packageName is null, please check"
    fi
}


### 读取系统内容
alias alPkgs='adb shell pm list packages'
alias alSysPkgs='adb shell pm list packages -s' #列出系统应用的所有包名
alias al3Pkgs='adb shell pm list packages -3'  #列出除了系统应用的第三方应用包名
alias alPkg='adb shell am monitor' #持续监控app的报名
alias alPkgFrom='adb shell pm list packages -i' #显示包的安装来源
alias alPkgAs='adb shell pm list pakcages -f' #显示包及关联的文件


function debug_help(){
    echo "amonkey  amonkeyPkg100"
    echo "afocus  aScrenRecord  screenCap  aUIDump  aScreenCap  startUiAutomatorViewer  startScreen"
    echo "startUIAutomator  screenCapFile"
}

### 焦点
alias afocus='adb shell dumpsys window | findstr mCurrentFocus'

### 录屏/截屏
alias aScreenRecord='adb shell screenrecord /sdcard/filename.mp4'
function screenCap(){
   adb shell system/bin/screencap -p sdcard/cap.png;
   adb pull sdcard/cap.png D:/;
   adb shell rm sdcard/cap.png;
}

### Monkey测试指令
alias amonkey='adb shell monkey'

function amonkeyPkg100(){
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


