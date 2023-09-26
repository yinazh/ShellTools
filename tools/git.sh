#!/bin/sh

## for git tools
function git_help(){
	echo "gada(add .)  gad(add)  gpl(pul)  gsts(status)  gcmt(commit -m)  gph(push)  gdf(diff)  gbh(branch)  gba(branch -a)"
	echo "gl(log)  gls(log -p)  glsw(log pretty==oneline)  gs(show)  grbs(rebase -hard)  gckt(checkout)"
	echo "gsubupdt(submodule update)  ghardPre(reset HEAD) greHard(reset --hard)  grstMaster(reset hard master)"
	echo "gphMaster(push master) gphMain(push main) uploadCode  uploadGitLabelCode  uploadGitHubCode"
}

alias gada='git add .'
alias gad='git add'
alias gpl='git pull'
alias gsts='git status .'
alias gcmt='git commit -m'
alias gphMaster='git push -u origin HEAD:refs/for/master'
alias gph='git push -u origin'
alias gl="git log"
alias gls="git log -p"
alias glsw="git log --pretty=oneline"
alias gs="git show"
alias gdf="git diff"
alias gbh='git branch'
alias gbha='git branch -a'
alias grbs='git rebase --hard'
alias gckt='git checkout'
alias gsubupdt='git submodule update'

alias ghardPre="git reset HEAD^"
alias greHard='git reset --hard '
alias grstMaster='git reset hard origin/master'

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
	
	git add .;
	git commit -m "${COMMIT_INFO}";
	git push -u origin HEAD:refs/for/${1}
}

function uploadGitLabCode(){
   if [ "$1" ];then
	   git add .;
	   COMMIT_INFO=`git commit -m "$1"`
	   echo $COMMIT_INFO
   fi
}

## for github
alias gphMain='git push -u origin main'

function uploadGithubcode(){
	DATE=`date "+%Y%m%d"`
	DEFAULT_COMMIT_INFO="upload and backup info ${DATE}"
	COMMIT_INFO=''
	if [ -z "$1" ] ;then
		COMMIT_INFO=${DEFAULT_COMMIT_INFO}
	else
	    COMMIT_INFO=$1
	fi
        git add .;
	git commit -m "${COMMIT_INFO}";
	git push -u origin main;
}
