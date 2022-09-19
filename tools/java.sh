#!/bin/sh

## apk分析工具
## github地址：https://github.com/google/android-classyshark



function sharkApk(){
	if [ "$1" ];then
       java -jar /d/code/ShellTools/source/ClassyShark.jar -open $1
    else
       echo "apk is null"
    fi
}

function uncompileApk(){
    if [ "$1" ];then
       java -jar /d/code/ShellTools/android/apktool_2.6.1.jar d  -f $1 /d/workspace/test/
    else
       echo "apk is null"
    fi
}