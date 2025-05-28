#!/bin/sh

export WIN_ENV_DIR="${CMDER_ROOT}/../../code/ShellTools/windows/script"

alias shutdown='python ${WIN_ENV_DIR}/shutdown.py'
alias reboot='python ${WIN_ENV_DIR}/reboot.py'
