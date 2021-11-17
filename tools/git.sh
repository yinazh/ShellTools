#!/bin/sh

## for git tools
alias gAddAll='git add .'
alias gAdd='git add'
alias gPull='git pull'
alias gStatus='git status .'
alias gCommit='git commit -m'
alias gPushMaster='git push -u origin HEAD:refs/for/master'
alias gPush='git push -u origin'
alias gLog="git log"
alias gLogS="git log -p"
alias gLogshow="git log --pretty=oneline"
alias gShow="git show"
alias gDiff="git diff"
alias gBranch='git branch'
alias gBranchAll='git branch -a'
alias gRebase='git rebase --hard'


function uploadCode(){
    if [ -z "$1" ] ;then
      echo "branch info is null, please check"
	  return
	fi
	UPLOAD_BRANCH=$1
	
    DATE=`date "+%Y%m%d_%H%M%S"`
	DEFAULT_COMMIT_INFO='upload and backup info ${DATE}'
	COMMIT_INFO=''
	if [ -z "$2" ] ;then
		echo "commit info is null, use Default info: ${DEFAULT_COMMIT_INFO}"
		COMMIT_INFO=${DEFAULT_COMMIT_INFO}
	else
	    COMMIT_INFO=$2
	fi
	
	gAddAll;
	gCommit "${COMMIT_INFO}";
	gPush HEAD:refs/for/${1}
}

function uploadGitLabCode(){
   if [ "$1" ];then
	   gAddAll;
	   COMMIT_INFO=`git commit -m "$1"`
	   echo $COMMIT_INFO
   fi
}

## for github
alias gPushMain='git push -u origin main'

function uploadGithubcode(){
	DATE=`date "+%Y%m%d"`
	DEFAULT_COMMIT_INFO="upload and backup info ${DATE}"
	COMMIT_INFO=''
	if [ -z "$1" ] ;then
		echo "commit info is null, use Default info: ${DEFAULT_COMMIT_INFO}"
		COMMIT_INFO=${DEFAULT_COMMIT_INFO}
	else
	    COMMIT_INFO=$1
	fi
    gAddAll;
	gCommit "${COMMIT_INFO}";
	gPushMain;
}