#!/bin/sh

## apk分析工具
## github地址：https://github.com/google/android-classyshark



function sharkApk(){
	if [ "$1" ];then
       java -jar /d/tools/ShellTools/source/ClassyShark.jar -open $1
    else
       echo "apk is null"
    fi
}

function uncompileApk(){
    if [ "$1" ];then
       java -jar /d/tools/ShellTools/source/apktool_2.6.1.jar d  -f $1 /d/
    else
       echo "apk is null"
    fi
}
