#!/bin/sh

## for adb tools

export SHELL_DIR="${CMDER_ROOT}/../ShellTools"

### adb指令说明文档
function adb_tools_help(){
	ip_help
	adb_help
	keydown_help
	broad_help
	logcat_help
	app_runtime_help
	android_help
	android_system_help
	debug_help
}

function adb_help(){
	echo -e "${FONT_YELLOW_UNDERLINE}asser${FONT_RES}(启动adb)  ${FONT_YELLOW_UNDERLINE}akser${FONT_RES}(关闭adb)  ${FONT_RED_UNDERLINE}ashl${FONT_RES}(shell)  ${FONT_GREEN_UNDERLINE}arot${FONT_RES}(root)  ${FONT_RED_UNDERLINE}arbot${FONT_RES}(reboot)  ${FONT_YELLOW_UNDERLINE}amont${FONT_RES}(remount)  ${FONT_RED_UNDERLINE}adev${FONT_RES}(devices)  ${FONT_GREEN_UNDERLINE}acon${FONT_RES}(connect)  ${FONT_RED_UNDERLINE}condev${FONT_RES}(root+remount)"
	echo -e "${FONT_RED_UNDERLINE}adiscon${FONT_RES}(disconnect)  ${FONT_GREEN_UNDERLINE}ainstal${FONT_RES}(install)  ${FONT_BLUE_UNDERLINE}ainstar${FONT_RES}(install -r)  ${FONT_PINK_UNDERLINE}ainstat${FONT_RES}(install -t安装testOnly=true的应用)  ${FONT_YELLOW_UNDERLINE}ainstas${FONT_RES}(install -s安装到dcard)"  
	echo -e "${FONT_YELLOW_UNDERLINE}ainstag${FONT_RES}(install -g授予所有运行时权限)  ${FONT_RED_UNDERLINE}ainstad${FONT_RES}(install -d允许降级覆盖安装)  ${FONT_GREEN_UNDERLINE}auinstak${FONT_RES}(uninstall -k保留数据和缓存)"
	echo -e "${FONT_RED_UNDERLINE}apul${FONT_RES}(pull)  ${FONT_BLUE_UNDERLINE}apush${FONT_RES}(push)  ${FONT_YELLOW_UNDERLINE}astart${FONT_RES}(am start)  ${FONT_RED_UNDERLINE}abroad${FONT_RES}(am broadcast -a)  ${FONT_BLUE_UNDERLINE}acls${FONT_RES}(pm clear)  ${FONT_YELLOW_UNDERLINE}astop${FONT_RES}(am force-stop)"
	echo -e "${FONT_YELLOW_UNDERLINE}ashutDown${FONT_RES}  ${FONT_RED_UNDERLINE}astartW${FONT_RES}(显示应用启动耗时)"
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
	echo -e "${FONT_RED_UNDERLINE}conip${FONT_RES}(connect ip)  ${FONT_GREEN_UNDERLINE}consip${FONT_RES}(连接同网段内ip)"
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
	echo -e "${FONT_RED_UNDERLINE}keyDown${FONT_RES}(keyevent)  ${FONT_YELLOW_UNDERLINE}whileKeyDown${FONT_RES}(loop keyevent)  ${FONT_BLUE_UNDERLINE}keyBack${FONT_RES}  ${FONT_GREEN_UNDERLINE}keyHome${FONT_RES}  ${FONT_YELLOW_UNDERLINE}keyScreenCap${FONT_RES}  ${FONT_RED_UNDERLINE}keyScreenOn${FONT_RES}  ${FONT_GREEN_UNDERLINE}keyScreenOff${FONT_RES}"
	echo -e "${FONT_BLUE_UNDERLINE}keyVol+${FONT_RES}  ${FONT_BLUE_UNDERLINE}keyVol-${FONT_RES}  ${FONT_YELLOW_UNDERLINE}keyBright+${FONT_RES}  ${FONT_YELLOW_UNDERLINE}keyBright-${FONT_RES}  ${FONT_RED_UNDERLINE}keyInput${FONT_RES}  ${FONT_BLUE_UNDERLINE}keyMute${FONT_RES}  ${FONT_YELLOW_UNDERLINE}keyPower${FONT_RES}"
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
	echo -e "${FONT_BLUE_UNDERLINE}bBootCompleted${FONT_RES}  ${FONT_BLUE_UNDERLINE}bBootCompletedPkg${FONT_RES}  ${FONT_YELLOW_UNDERLINE}bScreenOn${FONT_RES}  ${FONT_GREEN_UNDERLINE}bScreenOnPkg${FONT_RES}  ${FONT_YELLOW_UNDERLINE}bScreenOff${FONT_RES}  ${FONT_YELLOW_UNDERLINE}bScrenOffPkg${FONT_RES}"
	echo -e "${FONT_RED_UNDERLINE}bAction${FONT_RES}  ${FONT_YELLOW_UNDERLINE}whileBAction${FONT_RES}"
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
	echo -e "${FONT_YELLOW_UNDERLINE}alogt${FONT_RES}(-v time)  ${FONT_RED_UNDERLINE}alogc${FONT_RES}(-c)  ${FONT_BLUE_UNDERLINE}alruntime${FONT_RES}(AndroidRuntime)  ${FONT_GREEN_UNDERLINE}alogw${FONT_RES}(*W)  ${FONT_RED_UNDERLINE}aloge${FONT_RES}(*E)  ${FONT_PINK_UNDERLINE}abug${FONT_RES}(bugreport)  ${FONT_GREEN_UNDERLINE}pidcat${FONT_RES}"
	echo -e "${FONT_BLUE_UNDERLINE}alogcat${FONT_RES}(radio, main, events, null > file)  ${FONT_RED_UNDERLINE}systrace${FONT_RES}"
}


alias alogt='adb logcat -v time'
alias alogc='adb logcat -c'
alias alruntime='adb logcat -s AndroidRuntime'
alias alogd='adb logcat \*:D'
alias alogw='adb logcat \*:W'
alias aloge='adb logcat \*:E'
alias abug='adb bugreport'
alias pidcat='python ${SHELL_DIR}/tools/pidcat.py'

function alogcat(){
  DATE=`date "+%y%m%d%H%M%S"`
  #echo ${DATE}
  LOCAL_PATH=$(pwd)
  #echo $LOCAL_PATH
  adb logcat -c ;
  #echo "log..."
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
}


function app_runtime_help(){
	echo -e "${FONT_RED_UNDERLINE}atop${FONT_RES}  ${FONT_GREEN_UNDERLINE}atop10${FONT_RES}  ${FONT_BLUE_UNDERLINE}adumps${FONT_RES}  ${FONT_YELLOW_UNDERLINE}adumAcy${FONT_RES}(当前应用)  ${FONT_PINK_UNDERLINE}ameminfo${FONT_RES}(内存使用情况)  ${FONT_RED_UNDERLINE}aserlist${FONT_RES}(服务列表)"
	echo -e "${FONT_BLUE_UNDERLINE}adumpHeap${FONT_RES}(堆栈信息>file)  ${FONT_YELLOW_UNDERLINE}adumpsPkg${FONT_RES}(堆栈运行信息)  ${FONT_RED_UNDERLINE}adumpPkgFile${FONT_RES}(堆栈运行信息>file)"
	echo -e "${FONT_GREEN_UNDERLINE}afPkgVsion${FONT_RES}(应用版本pkg)  ${FONT_BLUE_UNDERLINE}alpkgs${FONT_RES}(列出所有应用)  ${FONT_RED_UNDERLINE}alSysPkgs${FONT_RES}(列举系统应用)  ${FONT_YELLOW_UNDERLINE}alPkgFrom(${FONT_RES}显示安装来源)  ${FONT_GREEN_UNDERLINE}alPkgAs${FONT_RES}(显示包及关联文件)"
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
	echo -e "${FONT_BLUE_UNDERLINE}aSideLoad${FONT_RES}  ${FONT_YELLOW_UNDERLINE}aBootloader${FONT_RES}  ${FONT_RED_UNDERLINE}aRecovery${FONT_RES}  ${FONT_GREEN_UNDERLINE}aEdl${FONT_RES}  ${FONT_YELLOW_UNDERLINE}aDisverity${FONT_RES}"
}
### 模式权限相关
alias aSideLoad='adb sideload'
alias aBootloader='adb reboot bootloader'
alias aRecovery='adb reboot recovery'
alias aEdl='adb reboot edl'
alias aDisverity='adb disable-verity'
alias aAdloader='adb reboot autodloader'

function android_system_help(){
	echo -e "${FONT_RED_UNDERLINE}arprop${FONT_RES}(getprop)  ${FONT_GREEN_UNDERLINE}awprop${FONT_RES}(setprop)	${FONT_BLUE_UNDERLINE}abattery${FONT_RES}  ${FONT_YELLLOW_UNDERLINE}acpuInof${FONT_RES}  ${FONT_PINK_UNDERLINE}acpuInfoM${FONT_RES}  ${FONT_GREEN_UNDERLINE}amemInfo${FONT_RES}  ${FONT_RED_UNDERLINE}amodel${FONT_RES}  ${FONT_BLUE_UNDERLINE}amac${FONT_RES}"
	echo -e "${FONT_BLUE_UNDERLINE}awmSize${FONT_RES}  ${FONT_YELLOW_UNDERLINE}awmSizeReset${FONT_RES}  ${FONT_BLUE_UNDERLINE}adensity${FONT_RES}  ${FONT_YELLOW_UNDERLINE}adensityReset${FONT_RES}  ${FONT_RED_UNDERLINE}adeviceId${FONT_RES}  ${FONT_GREEN_UNDERLINE}aipWlan${FONT_RES}  ${FONT_GREEN_UNDERLINE}aipEth${FONT_RES}  ${FONT_RED_UNDERLINE}awindow${FONT_RES}"
	echo -e "${FONT_GREEN_UNDERLINE}aAndroidVersion${FONT_RES}  ${FONT_YELLOW_UNDERLINE}asdk${FONT_RES}  ${FONT_RED_UNDERLINE}abuildProp${FONT_RES} ${FONT_PINK_UNDERLINE}acpuSupl${FONT_RES}  ${FONT_RED_UNDERLINE}advkHeapSize${FONT_RES}  ${FONT_GREEN_UNDERLINE}aSufaceFlinger${FONT_RES}  ${FONT_YELLOW_UNDERLINE}agfxinfo${FONT_RES}(测试性能pkg)"
	 echo -e "${FONT_RED_UNDERLINE}aSystem${FONT_RES}(system属性列表)  ${FONT_GREEN_UNDERLINE}aGlobal${FONT_RES}(global属性列表)  ${FONT_YELLOW_UNDERLINE}aSecure${FONT_RES}(secure属性列表)"
	echo -e "${FONT_BLUE_UNDERLINE}r/wShowTouches${FONT_RES}(屏幕點擊位置)  ${FONT_YELLOW_UNDERLINE}r/wPointerLocation${FONT_RES}(屏幕點擊位置坐標)"
	echo -e "${FONT_YELLOW_UNDERLINE}r/wScreenOffTime${FONT_RES}(设置熄屏时间)  ${FONT_BLUE_UNDERLINE}r/wScreenBright${FONT_RES}(设置屏幕亮度)  ${FONT_GREEN_UNDERLINE}r/wScreenBrightMode${FONT_RES}(自动调节亮度)"
	echo -e "${FONT_RED_UNDERLINE}arSystem${FONT_RES}   ${FONT_GREEN_UNDERLINE}arGlobal${FONT_RES}  ${FONT_YELLOW_UNDERLINE}arSecure${FONT_RES}  ${FONT_RED_UNDERLINE}awSystem${FONT_RES}  ${FONT_GREEN_UNDERLINE}awGlobal${FONT_RES}  ${FONT_YELLOW_UNDERLINE}awSecure${FONT_RES}"
	echo -e "${FONT_YELLOW_UNDERLINE}startSettings${FONT_RES}  ${FONT_BLUE_UNDERLINE}startDevelopSettings${FONT_RES}  ${FONT_PINK_UNDERLINE}closeAdb${FONT_RES}  ${FONT_GREEN_UNDERLINE}openWifi${FONT_RES}  ${FONT_RED_UNDERLINE}closeWifi${FONT_RES}"
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

## 设置系统数据库配置
alias aSystem='adb shell settings list system'
alias aGlobal='adb shell settings list global'
alias aSecure='adb shell settings list secure'
alias arSystem='adb shell settings get system'
alias arGlobal='adb shell settings get global'
alias arSecure='adb shell settings get secure'
alias awSystem='adb shell settings put system'
alias awGlobal='adb shell settings put global'
alias awSecure='adb shell settings put secure'

##设置息屏时间
alias wScreenOffTime='awSystem screen_off_timeout'
alias rScreenOffTime='arSystem screen_off_timeout'
##设置屏幕亮度
alias wScreenBright='awSystem screen_brightness'
alias rScreenBright='arSystem screen_brightness'
##通过网络获取时间状态
alias wAutoTime='awGlobal auto_time'
alias rAutoTime='arGlobal auto_time'
##获取系统默认输入发
alias rDefaultInputMethod='arSecure default_input_method'
alias wDefaultInputMethod='awSecure default_input_method'
##自动调节亮度
alias wScreenBightMode='awSystem screen_brightness_mode'
alias rScreenBrightMode='arSystem screen_brightness_mode'
##屏幕点击位置
alias wShowTouches='awSystem show_touches'
alias rShowTouches='arSystem show_touches'
##屏幕点击位置坐標
alias wPointerLocation='awSystem pointer_location'
alias rPointerLocation='arSystem pointer_location'


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
    echo -e "${FONT_RED_UNDERLINE}amonkey${FONT_RES}  ${FONT_YELLOW_UNDERLINE}amonkeyPkg100${FONT_RES}"
    echo -e "${FONT_GREEN_UNDERLINE}afocus${FONT_RES}  ${FONT_GREEN_UNDERLINE}aScrenRecord${FONT_RES}  ${FONT_BLUE_UNDERLINE}screenCap${FONT_RES}  ${FONT_YELLOW_UNDERLINE}aUIDump${FONT_RES}  ${FONT_RED_UNDERLINE}aScreenCap${FONT_RES}  ${FONT_GREEN_UNDERLINE}startUiAutomatorViewer${FONT_RES}  ${FONT_GREEN_UNDERLINE}startScreen${FONT_RES}"
    echo -e "${FONT_RED_UNDERLINE}startUIAutomator${FONT_RES}  ${FONT_YELLOW_UNDERLINE}screenCapFile${FONT_RES}"
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
### 打开开发者模式页面
alias startDevelopSetting='adb shell am start -n com.android.settings/com.android.settiings.DevelopmentSettings'

alias closeAdb='adb shell settings put global adb_enabled 0'
alias openWifi='adb shell svc wifi enable'
alias closeWifi='adb shell svc wifi disable'

