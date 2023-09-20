#!/bin/sh

#echo $(pwd)

## cmder的路径有问题，需要根据CMDER_ROOT的绝对路径来处理
#export TOOLS_PATH=$(pwd)
export TOOLS_PATH="${CMDER_ROOT}/../../code/ShellTools"

## source all tools shell tools
source ${TOOLS_PATH}/env.sh
source ${TOOLS_PATH}/tools/adb.sh
source ${TOOLS_PATH}/tools/fastboot.sh
source ${TOOLS_PATH}/tools/java.sh
source ${TOOLS_PATH}/tools/git.sh
source ${TOOLS_PATH}/tools/apt.sh
source ${TOOLS_PATH}/work/puppyTools.sh
source ${TOOLS_PATH}/work/jinggong.sh
source ${TOOLS_PATH}/windows/windowsTools.sh
