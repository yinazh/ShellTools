#!/bin/sh

## for git tools
alias gad='git add .'
alias gpl='git pull'
alias gst='git status .'
alias gcm='git commit -m'
alias gpm='git push -u origin HEAD:refs/for/master'
alias gpd='git push -u origin master'
alias gp='git push -u origin'
alias glog="git log"
alias glogS="git log -p"
alias glogshow="git log --pretty=oneline"
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
alias gpMain='git push -u origin main'