#!/bin/sh

#echo $(pwd)

## cmder的路径有问题，需要根据CMDER_ROOT的绝对路径来处理
#export TOOLS_PATH=$(pwd)
export TOOLS_PATH="${CMDER_ROOT}/../ShellTools"

## load env config
source ${TOOLS_PATH}/env/font.sh

## source all tools shell tools
source ${TOOLS_PATH}/env/windowsEnv.sh
source ${TOOLS_PATH}/help/help.sh
source ${TOOLS_PATH}/tools/adb.sh
source ${TOOLS_PATH}/tools/fastboot.sh
source ${TOOLS_PATH}/tools/java.sh
source ${TOOLS_PATH}/tools/git.sh
source ${TOOLS_PATH}/tools/apt.sh
source ${TOOLS_PATH}/tools/hdc.sh
#source ${TOOLS_PATH}/work/puppyTools.sh
#source ${TOOLS_PATH}/work/jinggong.sh
source ${TOOLS_PATH}/work/superred.sh
source ${TOOLS_PATH}/windows/script/windowsCommon.sh
source ${TOOLS_PATH}/windows/windowsTools.sh
source ${TOOLS_PATH}/user.sh
source ${TOOLS_PATH}/tools/time.sh

function helps(){
    echo -e "${FONT_RED_UNDERLINE}个人信息帮助${FONT_RES}： user_help"
    echo -e "${FONT_BLUE_UNDERLINE}万里红信息${FONT_RES}: superred_help"
    #echo -e "${FONT_BLUE_UNDERLINE}精工帮助${FONT_RES}： jinggong_help"
    echo -e "${FONT_YELLOW_UNDERLINE}开发帮助${FONT_RES}："
    echo -e "          adb_tools_help， keydown_help， broad_help， logcat_help， app_runtime_help"
    echo -e "          android_help， android_system_help， debug_help，  adb_tools_help"
    echo -e "          git_help， doc_help， windows_help"
    
    echo -e "${FONT_YELLOW_UNDERLINE}文档帮助${FONT_RES}：doc_help"
}

alias viUserInfo='vi ${TOOLS_PATH}/user.sh'
alias viWorkInfo='vi ${TOOLS_PATH}/work/superred.sh'
