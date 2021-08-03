#!/bin/sh

## for git tools
alias gAdda='git add .'
alias gAdd='git add'
alias gPul='git pull'
alias gSta='git status .'
alias gCom='git commit -m'
alias gPushMaster='git push -u origin HEAD:refs/for/master'
alias gPush='git push -u origin'
alias gLog="git log"
alias gLogS="git log -p"
alias gLogshow="git log --pretty=oneline"
alias gShow="git show"


function uploadCode(){
   UPLOAD_BRANCH=$1
   COMMIT_INFO=$2
   gad;
   gcm "${COMMIT_INFO}";
   gp HEAD:refs/for/${1}
}

function uploadGidLabCode(){
   if [ "$1" ];then
	   git add .
	   COMMIT_INFO=`git commit -m "$1"`
	   echo $COMMIT_INFO
   fi
}

## for github
alias gPushMain='git push -u origin main'