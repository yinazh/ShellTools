#!/bin/sh

export HELP_DIR="${CMDER_ROOT}/../../code/ShellTools/help"

function doc_help(){
	echo -e "${FONT_YELLOW_UNDERLINE}AndroidStudioSC${FONT_RES}  ${FONT_RED_UNDERLINE}logcatDoc${FONT_RES}  ${FONT_BLUE_UNDERLINE}markdownDoc${FONT_RES}"
	echo -e "${FONT_GREEN_UNDERLINE}磁盘管理${FONT_RES}： ddDoc"
    echo -e "${FONT_GREEN_UNDERLINE}awk查询${FONT_RES}： awkDoc"
    echo -e "${FONT_GREEN_UNDERLINE}git指令${FONT_RES}： gitDoc"
	echo -e "${FONT_GREEN_UNDERLINE}find查询${FONT_RES}： findDoc"
	echo -e "${FONT_GREEN_UNDERLINE}grep查询${FONT_RES}： grepDoc"
	echo -e "${FONT_GREEN_UNDERLINE}sqlite3指令${FONT_RES}： sqlite3Doc"
	echo -e "${FONT_GREEN_UNDERLINE}wget指令${FONT_RES}： wgetDoc"
	echo -e "${FONT_GREEN_UNDERLINE}time指令${FONT_RES}： timeDoc"
	echo -e "${FONT_YELLOW_UNDERLINE}zip指令${FONT_RES}:zipDoc"
}

alias AndroidStudioSC='cat ${HELP_DIR}/AndroidStudioShortCut.md'
alias logcatDoc='vim ${HELP_DIR}/logcat.md'
alias markdownDoc='vim ${HELP_DIR}/markdown.md'
alias ddDoc='vim dd_doc.sh'
alias awkDoc="vim awk_doc.sh"
alias findDoc='vim find_doc.sh'
alias gitDoc='vim git_doc.sh'
alias grepDoc='vim grep_doc.sh'
alias sqlite3Doc='vim sqlite3_help.sh'
alias timeDoc='vim time_doc.sh'
alias wgetDoc='vim wget_doc.sh'
alias zipDoc='vim zip_doc.md'
