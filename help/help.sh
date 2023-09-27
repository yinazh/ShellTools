#!/bin/sh

export HELP_DIR="${CMDER_ROOT}/../../code/ShellTools/help"

function doc_help(){
	echo "AndroidStudioSC  logcatDoc  markdownDoc"
}

alias AndroidStudioSC='cat ${HELP_DIR}/AndroidStudioShortCut.md'
alias logcatDoc='cat ${HELP_DIR}/logcat.md'
alias markdownDoc='cat ${HELP_DIR}/markdown.md'


