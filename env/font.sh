#!/bin/sh

# 字体颜色
## 字体颜色 30-37
## 0-默认  30-黑色  31-红色  32-绿色  33-黄色  34-蓝色  35-紫色  36-青色  37-白色
## 背景颜色 40-47
## 0-默认  40-黑色  41-红色  42-绿色  43-黄色  44-蓝色  45-紫色  46-青色  47-白色
## 黑底彩色 90-97
## 90-黑  91-深红  92-绿  93-黄色  84-蓝色  95-紫色  96-青色  97-白色

## echo -e "${RED}RED${RES}"
FONT_BLACK='\e[0;30m'
FONT_RED='\e[0;31m'
FONT_GREEN='\e[0;32m'
FONT_YELLOW='\e[0;33m'
FONT_BLUE='\e[0;34m'
FONT_PINK='\e[0;35m'
FONT_WHITE='\e[0;37m'
FONT_RES='\e[0m'

FONT_BLACK_BOLD='\e[1;30m'
FONT_RED_BOLD='\e[1;31m'
FONT_GREEN_BOLD='\e[1;32m'
FONT_YELLOW_BOLD='\e[1;33m'
FONT_BLUE_BOLD='\e[1;34m'
FONT_PINK_BOLD='\e[1;35m'
FONT_WHITE_BOLD='\e[1;37m'


FONT_BLACK_UNDERLINE='\e[4;30m'
FONT_RED_UNDERLINE='\e[4;31m'
FONT_GREEN_UNDERLINE='\e[4;32m'
FONT_YELLOW_UNDERLINE='\e[4;33m'
FONT_BLUE_UNDERLINE='\e[4;34m'
FONT_PINK_UNDERLINE='\e[4;35m'
FONT_WHITE_UNDERLINE='\e[4;37m'

BG_BLACK='\e[1;40m'
BG_RED='\e[1;41m' 
BG_GREEN='\e[1;42m' 
BG_YELLOW='\e[1;43m' 
BG_BLUE='\e[1;44m' 
BG_PINK='\e[1;45m' 

FONT_RED_V2=$(tput setaf 1)
FONT_GREEN_V2=$(tput setaf 2)
FONT_YELLOW_V2=$(tput setaf 3)
FONT_BLUE_V2=$(tput setaf 4)
FONT_PINK_V2=$(tput setaf 5)
FONT_RES_V2=$(tput sgr0)

## 粗体高亮
FONT_HIGH_BRIGHTNESS='\e[1m'
FONT_RESET_HIGH_BRIGHTNESS='\e[21m'
## 下划线
FONT_UNDERLINE='\e[4m'
FONT_RESET_UNDERLINE='\e[24m'
## 闪烁
FONT_FLASH='\e[5m'
FONT_RESET_FLASH='\e[25m'
## 反显
FONT_REVERSE='\e[7m'
FONT_RESET_REVERSE='\e[27m'
## 变暗
FONT_DIM='\e[2m'
FONT_RESET_DIM='\e[22m'
## 隐藏
FONT_HIDE='\e[8m'
FONT_RESET_HIDE='\e[28m'

function blackFont(){
    echo -e ${FONT_BLACK}${1}${FONT_RES}
}

function redFont(){
    echo -e ${FONT_RED}${1}${FONT_RES}
}

function greenFont(){
    echo -e ${FONT_GREEN}${1}${FONT_RES}
}

function yellowFont(){
    echo -e ${FONT_YELLOW}${1}${FONT_RES}
}

function blueFont(){
    echo -e ${FONT_BLUE}${1}${FONT_RES}
}

function pinkFont(){
    echo -e ${FONT_PINK}${1}${FONT_RES}
}

function blackBoldFont(){
    echo -e ${FONT_BLACK_BOLD}${1}${FONT_RES}
}

function redBoldFont(){
    echo -e ${FONT_RED_BOLD}${1}${FONT_RES}
}

function greenBoldFont(){
    echo -e ${FONT_GREEN_BOLD}${1}${FONT_RES}
}

function yellowBoldFont(){
    echo -e ${FONT_YELLOW_BOLD}${1}${FONT_RES}
}

function blueBoldFont(){
    echo -e ${FONT_BLUE_BOLD}${1}${FONT_RES}
}

function pinkBoldFont(){
    echo -e ${FONT_PINK_BOLD}${1}${FONT_RES}
}

function blackUnderlineFont(){
    echo -e ${FONT_BLACK_UNDERLINE}${1}${FONT_RES}
}

function redUnderlineFont(){
    echo -e ${FONT_RED_UNDERLINE}${1}${FONT_RES}
}

function greenUnderlineFont(){
    echo -e ${FONT_GREEN_UNDERLINE}${1}${FONT_RES}
}

function yellowUnderlineFont(){
    echo -e ${FONT_YELLOW_UNDERLINE}${1}${FONT_RES}
}

function blueUnderlineFont(){
    echo -e ${FONT_BLUE_UNDERLINE}${1}${FONT_RES}
}

function pinkUnderlineFont(){
    echo -e ${FONT_PINK_UNDERLINE}${1}${FONT_RES}
}


function highBrightFont(){
	echo -e ${FONT_HIGH_BRIGHTNESS}${1}${FONT_RESET_HIGH_BRIGHTNESS}
}

function underlineFont(){
	echo -e ${FONT_UNDERLINE}${1}${FONT_RESET_UNDERLINE}
}

function flashFont(){
    echo -e ${FONT_FLASH}${1}${FONT_RESET_FLASH}
}

function reverseFont(){
    echo -e ${FONT_REVERSE}${1}${FONT_RESET_REVERSE}
}


function dimFont(){
    echo -e ${FONT_DIM}${1}${FONT_RESET_DIM}
}

function hideFont(){
    echo -e ${FONT_HIDE}${1}${FONT_RESET_HIDE}
}





