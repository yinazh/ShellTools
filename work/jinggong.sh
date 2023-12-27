#!/bin/sh

function jinggong_help(){
	echo -e "${FONT_RED_UNDERLINE}vaiot_develop_help${FONT_RES}(开发资源) ${FONT_GREEN_UNDERLINE}vaiot_url_help${FONT_RES}(精工网址导航)"
	echo -e "${FONT_GREEN_UNDERLINE}code_help${FONT_RES}(代码提示) ${FONT_YELLOW_UNDERLINE}user_help${FONT_RES}(个人资料)"
	echo -e "${FONT_BLUE_UNDERLINE}gateway_help${FONT_RES}(配网遇到的问题)  ${FONT_YELLOW_UNDERLINE}editGatewayDoc${FONT_RES}(编辑记录配网问题)"
	echo -e "${FONT_PINK_UNDERLINE}editLocalReleaseNote${FONT_RES}(本地版本释放记录)  ${FONT_BLUE_UNDERLINE}editRemoteReleaseNote${FONT_RES}(远程版本释放记录)"
}

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

##alias vaiot_help='cat /d/workspace/开发资源.md'
function vaiot_develop_help(){
        echo -e "${BG_RED}*****15.6寸屏配置记录*****${FONT_RES}"
        echo -e "${FONT_YELLOW_UNDERLINE}万象${FONT_RES}：空调网关（需要添加3到5个空调）、新风网关、智能计量计（一键断电）"	
		echo -e "${FONT_BLUE_UNDERLINE}万物${FONT_RES}：智能计量计（一键断电）、三键开关、八合一空气盒子"

        echo -e "${BG_GREEN}*****配网手机号*****${FONT_RES}"		
	        echo -e "**老账户，废弃**"
		echo -e "${FONT_GREEN_UNDERLINE}dev环境${FONT_RES}：13213333367    1234@com"
		echo -e "${FONT_YELLOW_UNDERLINE}beta环境${FONT_RES}：13111112235    1234@com"
		echo -e "${FONT_RED_UNDERLINE}prod环境${FONT_RES}：13200001124    1234@com"
		echo -e "**新账户，及业主账号**"
		echo -e "${FONT_RED_UNDERLINE}新账号 13406334229   验证码6666  直接使用爱情芳华里1702的房间${FONT_RES}"


		echo -e "${BG_YELLOW}*****OTA配置*****${FONT_RES}"
		echo -e "${FONT_GREEN_UNDERLINE}说明${FONT_RES}：运营平台boss环境，账户密码统一为：admin  1234@com"
		echo -e "${FONT_RED_UNDERLINE}dev环境${FONT_RES}：https://boss-dev.vaiotsmart.com:10001/appCenter/versionManage"
		echo -e "${FONT_GREEN_UNDERLINE}prod环境${FONT_RES}：https://boss.vaiot.com/appCenter/versionManage"

		echo -e "${BG_GREEN}*****添加楼盘数据*****${FONT_RES}"
		echo -e "${FONT_GREEN_UNDERLINE}说明${FONT_RES}：运营平台地址，账户密码为：assets  1234@com"
		echo -e "${FONT_RED_UNDERLINE}dev环境${FONT_RES}：https://sop-dev.vaiotsmart.com:10001/community/construction/worker"
		
		echo -e "${BG_RED}*****figima*****${FONT_RES}"
		echo -e "${FONT_GREEN_UNDERLINE}说明${FONT_RES}：个人账户，账户密码为：yaz937231979@163.com  yinazh3083"
		echo -e "${FONT_RED_UNDERLINE}dev环境${FONT_RES}：https://sop-dev.vaiotsmart.com:10001/community/construction/worker"
		
		echo -e "${BG_YELLOW}*****开发导航*****${FONT_RES}"
		echo -e "${FONT_GREEN_UNDERLINE}页面标识对照表${FONT_RES}：https://docs.vaiotsmart.com/pages/viewpage.action?pageId=13500879"
		echo -e "${FONT_RED_UNDERLINE}IOT物接入流程${FONT_RES}：https://docs.vaiotsmart.com/pages/viewpage.action?pageId=5210116"
		echo -e "${FONT_YELLOW_UNDERLINE}86p屏版本发布${FONT_RES}：https://docs.vaiotsmart.com/pages/viewpage.action?pageId=18778373"
		echo -e "${FONT_BLUE_UNDERLINE}jira${FONT_RES}：https://jira.vaiotsmart.com/"
		echo -e "${FONT_PINK_UNDERLINE}gitlab${FONT_RES}：https://git.vaiotsmart.com/users/sign_in"
		echo -e "${FONT_YELLOW_UNDERLINE}metersphere${FONT_RES}：https://metersphere.vaiotsmart.com/login#/"
		
}

function code_help(){
		echo -e "${FONT_GREEN_UNDERLINE}重新挂载指令${FONT_RES}：mount -o remount -rw /dnake/bin"
}

## 开发用到的网址
function vaiot_url_help(){
        echo -e "${FONT_RED_UNDERLINE}项目管理系统${FONT_RES}:http://10.255.52.91:8082/automation/index.jsp"
		echo -e "${FONT_BLUE_UNDERLINE}长城号${FONT_RES}: https://4a.gwm.cn/index"
		echo -e "${FONT_YELLOW_UNDERLINE}绩效${FONT_RES}: https://eapms.gwm.cn/login"
		echo -e "${FONT_GREEN_UNDERLINE}财务共享平台${FONT_RES}:http://fssc.gwm.cn/react-basic-web/login"
		echo -e "${FONT_RED_UNDERLINE}企业数字化平台${FONT_RES}:http://platform.paas.gwm.cn/"
##		echo -e "${FONT_PINK_UNDERLINE}项目管理系统${FONT_RES}:"
##		echo -e "${FONT_GREEN_UNDERLINE}项目管理系统${FONT_RES}:"
##		echo -e "${FONT_BLUE_UNDERLINE}项目管理系统${FONT_RES}:"
##		echo -e "${FONT_YELLOW_UNDERLINE}项目管理系统${FONT_RES}:"
##		echo -e "${FONT_RED_UNDERLINE}项目管理系统${FONT_RES}:"
}
alias editVaiotDoc='start /d/workspace/开发资源.md'

alias gateway_help='cat /d/workspace/开发配网遇到的问题.md'
#alias editGatewayDoc='start /d/workspace/开发配网遇到的问题.md'

alias editLocalReleaseNote='start /d/workspace/release_version/local_release_notes.md'
alias editRemoteReleaseNote='start /d/workspace/release_version/remote_release_notes.md'
