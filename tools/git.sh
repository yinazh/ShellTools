#!/bin/sh

## for git tools
function git_help(){
	echo -e "${BG_RED}gada${FONT_RES}(add .)  ${FONT_BLUE_UNDERLINE}gad${FONT_RES}(add)  ${FONT_RED_UNDERLINE}gpl${FONT_RES}(pul)  ${FONT_GREEN_UNDERLINE}gsts${FONT_RES}(status)  ${FONT_PINK_UNDERLINE}gcmt${FONT_RES}(commit -m)  ${FONT_GREEN_UNDERLINE}gph${FONT_RES}(push)  ${FONT_BLUE_UNDERLINE}gdf${FONT_RES}(diff)  ${FONT_RED_UNDERLINE}gbh${FONT_RES}(branch)  ${FONT_PINK_UNDERLINE}gba${FONT_RES}(branch -a)"
	echo -e "${FONT_GREEN_UNDERLINE}gl${FONT_RES}(log)  ${FONT_RED_UNDERLINE}gls${FONT_RES}(log -p)  ${FONT_RED_UNDERLINE}glsw${FONT_RES}(log pretty==oneline)  ${FONT_BLUE_UNDERLINE}gs${FONT_RES}(show)  ${FONT_YELLOW_UNDERLINE}grbs${FONT_RES}(rebase -hard)  ${FONT_RED_UNDERLINE}gckt${FONT_RES}(checkout)"
	echo -e "${FONT_RED_UNDERLINE}gsubupdt${FONT_RES}(submodule update)  ${FONT_RED_UNDERLINE}ghardPre${FONT_RES}(reset HEAD) ${FONT_RED_UNDERLINE}greHard${FONT_RES}(reset --hard)  ${FONT_RED_UNDERLINE}grstMaster${FONT_RES}(reset hard master)"
	echo -e "${FONT_YELLOW_UNDERLINE}gphMaster${FONT_RES}(push master)  ${FONT_RED_UNDERLINE}gphMain${FONT_RES}(push main) ${FONT_GREEN_UNDERLINE}uploadCode${FONT_RES}  ${FONT_YELLOW_UNDERLINE}uploadGitLabelCode${FONT_RES}  ${FONT_PINK_UNDERLINE}uploadGitHubCode${FONT_RES}"
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
