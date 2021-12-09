#!/bin/sh

export TOOLS_PATH=$(pwd)

## source all tools shell tools
source ${TOOLS_PATH}/tools/adb.sh
source ${TOOLS_PATH}/tools/fastboot.sh
source ${TOOLS_PATH}/tools/git.sh
source ${TOOLS_PATH}/ubuntu/apt.sh
source ${TOOLS_PATH}/work/puppyTools.sh
