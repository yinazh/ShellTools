#!/bin/sh

export ENV_DIR="${CMDER_ROOT}/../../tools/ShellTools/env"

## 获取本机ip
alias ip='python ${ENV_DIR}/ip.py'
alias open='python ${ENV_DIR}/open.py'
alias captureScreen='python ${ENV_DIR}/../tools/captureScreen.py'