#!/bin/sh

export HELP_DIR="${CMDER_ROOT}/../../code/ShellTools/help"

function doc_help(){
	echo -e "${FONT_YELLOW_UNDERLINE}AndroidStudioSC${FONT_RES}  ${FONT_RED_UNDERLINE}logcatDoc${FONT_RES}  ${FONT_BLUE_UNDERLINE}markdownDoc${FONT_RES}"
}

alias AndroidStudioSC='cat ${HELP_DIR}/AndroidStudioShortCut.md'
alias logcatDoc='cat ${HELP_DIR}/logcat.md'
alias markdownDoc='cat ${HELP_DIR}/markdown.md'


