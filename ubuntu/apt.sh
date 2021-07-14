#!/bin/sh

##for ubuntu
alias aupdate='sudo apt update'
alias aupgrade='sudo apt upgrade'
alias aclean='sudo apt autoclean'
alias aremove='sudo apt autoremove'
alias ainstall='sudo apt install'
alias sr='sudo reboot'

## for ubuntu logcat
function pidcat(){
   if [ "$1" ];then
      python /home/yinazh/Android/Sdk/tools/pidcat.py $1
   else
      python /home/yinazh/Android/Sdk/tools/pidcat.py
   fi
}